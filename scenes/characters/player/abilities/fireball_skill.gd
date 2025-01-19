extends Node2D

@export var time_distance: int = 1
@export var fireball_scene: PackedScene
@onready var timer = $Timer as Timer


func _ready():
	timer.wait_time = time_distance
	timer.one_shot = false
	timer.timeout.connect(_on_timer_timeout)
	timer.start()


func _on_timer_timeout():
	var fireball = fireball_scene.instantiate()
	add_child(fireball)
