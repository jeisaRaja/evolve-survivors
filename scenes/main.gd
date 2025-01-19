extends Node2D

@onready var level_bar = %LevelProgressBar as TextureProgressBar
@onready var level = %Level as Label
@onready var enemy_spawner = $EnemySpawner as Node2D


func _ready():
	set_value()
	Event.player_dna_stats_updated.connect(_on_player_dna_stats_updated)
	Game.enemy_spawner = enemy_spawner


func _on_player_dna_stats_updated():
	set_value()


func set_value():
	level_bar.max_value = Game.get_level_up_treshold()
	level_bar.value = Game.get_player_points()
	level.text = "Level " + str(Game.get_player_current_level())
