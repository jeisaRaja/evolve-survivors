extends Area2D

@export var player_dna_stats: DnaStats


func _ready():
	area_entered.connect(_on_area_entered)


func _on_area_entered(area: Area2D):
	if area is Gem:
		match area.gem_res.Type:
			Game.GemType.STR:
				player_dna_stats.str_points += 1
				area.queue_free()
			Game.GemType.INT:
				player_dna_stats.int_points += 1
				area.queue_free()
			Game.GemType.AGI:
				player_dna_stats.agi_points += 1
				area.queue_free()

		Event.player_dna_stats_updated.emit()
