extends Area2D
signal enemy_target(enemy: Enemy)

var is_targetting: bool


func _ready():
	body_entered.connect(_on_enemy_entered)


func _on_enemy_entered(enemy: Node2D):
	if is_targetting:
		return
	if enemy is Enemy:
		enemy_target.emit(enemy)
		is_targetting = true
