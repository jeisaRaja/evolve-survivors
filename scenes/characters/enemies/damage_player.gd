class_name DamagePlayer
extends Area2D

enum DamageType { PER_SECOND, PER_HIT }
@export var damage: float
@export var damage_type: DamageType
var player: HurtBox


func _ready():
	area_entered.connect(_on_area_entered)
	area_exited.connect(_on_area_exited)


func _physics_process(delta):
	if player:
		player.take_damage(damage * delta)


func _on_area_entered(area: Area2D):
	if not area.is_in_group("player"):
		return
	if not area is HurtBox:
		return
	player = area
	if damage_type == DamageType.PER_HIT:
		area.take_damage(damage)


func _on_area_exited(area: Area2D):
	if area.is_in_group("player") and area is HurtBox:
		player = null
