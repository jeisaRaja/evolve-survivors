class_name Player
extends CharacterBody2D

@export var dna_stats: DnaStats
@onready var animation_player = $AnimationPlayer as AnimationPlayer
@onready var player_input = $PlayerInput as PlayerInput
@onready var movement = $Movement as Movement


func _ready():
	animation_player.play("idle")
	Game.player = self


func _physics_process(_delta):
	if dna_stats.total_points >= Game.get_level_up_treshold():
		dna_stats.level_up()
