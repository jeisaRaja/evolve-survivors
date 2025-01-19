extends Node

@export var player_dna_stats: DnaStats

var player: Player
var gem_scene: String = "res://scenes/gem.tscn"
var game_scene: String = "res://scenes/main.tscn"
var enemy_spawner: Node

enum GemType { STR, INT }
enum ClassType { STR, INT }

var enemy_limits_per_level = [9, 21, 41]
var level_up_thresholds = [5, 11, 21]


func _ready():
	pass


func get_enemy_limits():
	return enemy_limits_per_level[player_dna_stats.level]


func get_level_up_treshold():
	return level_up_thresholds[player_dna_stats.level]


func get_player_current_level():
	return player_dna_stats.level


func get_player_points():
	return player_dna_stats.total_points
