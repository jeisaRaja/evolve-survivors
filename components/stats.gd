extends Node
class_name Stats

@export var character_name: String
@export var health: int
@onready var character = $".."

signal died


func _ready():
	pass


func take_damage(damage: int):
	health = clampi(health - damage, 0, health)
	if health == 0:
		died.emit()
