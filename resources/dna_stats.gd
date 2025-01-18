class_name DnaStats
extends Resource

@export var int_points: int
@export var str_points: int
@export var agi_points: int
@export var level: int

var next_level_treshold: int


func level_up():
	level += 1


func reset_dna():
	int_points = 0
	str_points = 0
	agi_points = 0
