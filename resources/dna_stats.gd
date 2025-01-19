class_name DnaStats
extends Resource

@export var int_points: int
@export var str_points: int
@export var level: int

var total_points: int
var class_type: Game.ClassType
var next_level_treshold: int


func level_up():
	if int_points > str_points:
		class_type = Game.ClassType.INT
	else:
		class_type = Game.ClassType.STR

	reset_dna()
	level += 1
	Event.player_dna_stats_updated.emit()


func reset_dna():
	int_points = 0
	str_points = 0
	total_points = 0
