class_name EnemyInt0
extends CharacterBody2D

@onready var sprite = $Sprite2D
@onready var animation_player = $AnimationPlayer


func _ready():
	animation_player.play("walk")
