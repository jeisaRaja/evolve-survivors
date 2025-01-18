extends HealthStats
class_name PlayerStats

@export var dna_stats: DnaStats


func _set_health(value: float) -> void:
	health = value
	Event.player_health_updated.emit(health)
