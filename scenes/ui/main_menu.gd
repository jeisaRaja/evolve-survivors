extends Control

@onready var play_button: Button = %Play


func _ready():
	play_button.pressed.connect(_on_play_pressed)


func _on_play_pressed():
	var game_scene = load(Game.game_scene)
	var scene_instance = game_scene.instantiate()
	get_tree().root.add_child(scene_instance)
	queue_free()
