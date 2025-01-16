extends Area2D

@onready var animation = $AnimationPlayer as AnimationPlayer
@onready var sprite = $Sprite2D


func _ready():
	body_entered.connect(_on_body_entered)


func roll_dice():
	animation.play("roll")
	await get_tree().create_timer(2).timeout
	animation.stop()
	var numbers = [0, 2, 4, 6, 8, 10, 12]
	var weights = [1, 2, 3, 4, 3, 2, 1]
	var number = weighted_random(numbers, weights)
	sprite.frame = number


func sum(arr: Array):
	var result = 0
	for i in arr:
		result += i
	return result


func weighted_random(items: Array, weights: Array) -> Variant:
	var total_weight = sum(weights)
	var random_value = randf() * total_weight
	var cumulative_weight = 0

	for i in range(weights.size()):
		cumulative_weight += weights[i]
		if random_value < cumulative_weight:
			return items[i]
	return items[-1]


func _on_body_entered(body: Node2D):
	if not body is Player:
		return
	roll_dice()
