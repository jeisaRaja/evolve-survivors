extends Stats
class_name PlayerStats


func _set_health(value: float) -> void:
	health = value
	Event.player_health_updated.emit(health)
