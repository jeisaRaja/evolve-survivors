extends Node
class_name EnemyAI

@export var movement_speed: int = 20
@export var push_strength: int
@onready var enemy = self.owner as CharacterBody2D
var player: Player


func _ready():
	pass


func _physics_process(_delta):
	if not player:
		player = Game.player
		return
	var distance_to_player = enemy.global_position.distance_to(player.global_position)
	if distance_to_player < 8:
		return
	elif distance_to_player > 480:
		enemy.queue_free()
	var target_direction = enemy.global_position.direction_to(player.global_position)

	enemy.velocity = target_direction * movement_speed

	enemy.move_and_slide()
	enemy.sprite.flip_h = target_direction.x > 0
