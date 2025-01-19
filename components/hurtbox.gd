extends Area2D
class_name HurtBox

@onready var character = $".."
@export var stats: HealthStats
var hurt_flash_animation: AnimationPlayer


func _ready():
	area_entered.connect(_on_area_entered)
	stats.died.connect(_on_died)
	if not self.is_in_group("player"):
		hurt_flash_animation = %HurtFlash


func take_damage(damage: float):
	stats.take_damage(damage)


func _on_area_entered(area: Area2D):
	if area is PlayerHitbox and not self.is_in_group("player"):
		hurt_flash_animation.play("hurt_flash")
		stats.take_damage(area.damage)


func _on_died():
	if self.owner.is_in_group("player"):
		return
	if hurt_flash_animation.is_playing():
		await hurt_flash_animation.animation_finished
	if character is Enemy:
		var gem = load(Game.gem_scene).instantiate()
		gem.gem_res = character.gem_res
		gem.global_position = character.global_position
		get_tree().root.add_child(gem)
	character.queue_free()
