class_name Movement
extends Node

@export var velocity: float
@export var input: CharacterInput
@export var acceleration: float
@export var deceleration: float
@export var animation_player: AnimationPlayer

@onready var parent: CharacterBody2D = get_parent() as CharacterBody2D


func _ready():
	pass


func _physics_process(delta):
	var target_velocity = input.direction * velocity
	var factor = acceleration if input.direction != Vector2.ZERO else deceleration
	parent.velocity = parent.velocity.lerp(target_velocity, factor * delta)
	parent.move_and_slide()

	if not animation_player:
		return

	if target_velocity != Vector2.ZERO:
		if animation_player.current_animation != "walk":
			animation_player.play("walk")
	else:
		if animation_player.current_animation != "RESET":
			animation_player.play("RESET")
