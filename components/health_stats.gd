extends Node
class_name HealthStats

signal died

@export var character_name: String
@export var health: float:
	set = _set_health

@onready var character = $".."


func _ready():
	pass


func _set_health(value: float) -> void:
	health = value


func take_damage(damage: float):
	health = clamp(health - damage, 0, health)
	if health == 0:
		died.emit()
