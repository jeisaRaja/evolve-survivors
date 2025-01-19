extends Node


func get_random_direction() -> Vector2:
	var angle = randf() * TAU
	return Vector2(cos(angle), sin(angle))
