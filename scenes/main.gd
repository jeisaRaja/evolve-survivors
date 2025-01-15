extends Node2D

@onready var player_health_bar = %PlayerHealth as ProgressBar


func _ready():
	Event.player_health_updated.connect(_on_player_health_updated)


func _on_player_health_updated(health: float):
	player_health_bar.value = health
