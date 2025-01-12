extends Area2D
class_name HurtBox

@onready var hurt_flash_animation = %HurtFlash
@onready var character = $".."
@export var stats: Stats


func _ready():
	area_entered.connect(_on_area_entered)
	stats.died.connect(_on_died)


func _on_area_entered(area: Area2D):
	if area is PlayerHitbox:
		hurt_flash_animation.play("hurt_flash")
		stats.take_damage(area.damage)


func _on_died():
	if hurt_flash_animation.is_playing():
		await hurt_flash_animation.animation_finished
	character.queue_free()
