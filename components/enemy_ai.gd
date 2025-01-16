extends Node
class_name EnemyAI

@export var movement_speed: int
@onready var enemy = self.owner as CharacterBody2D
var player: Player


func _ready():
	pass


func _physics_process(_delta):
	if not player:
		player = Game.player
		return
	var distance_to_player = enemy.global_position.distance_to(player.global_position)
	if distance_to_player <= 5:
		return
	enemy.velocity = enemy.global_position.direction_to(player.position) * movement_speed
	enemy.move_and_slide()
	if enemy.velocity.x > 0:
		enemy.sprite.flip_h = true
	else:
		enemy.sprite.flip_h = false
