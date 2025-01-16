extends Resource
class_name SpawnInfo

@export var time_start: int
@export var time_end: int
@export var enemy: PackedScene
@export var enemy_num_min: int
@export var enemy_num_max: int
@export var enemy_spawn_delay_early: int
@export var enemy_spawn_delay_late: int

var spawn_delay_counter = 0


func get_enemy_num() -> int:
	return randi_range(enemy_num_min, enemy_num_max)


func get_enemy_spawn_delay() -> int:
	return randi_range(enemy_spawn_delay_early, enemy_spawn_delay_late)
