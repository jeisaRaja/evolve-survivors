class_name Fireball
extends PlayerHitbox

@export var speed: int = 80
@onready var anim = $AnimationPlayer as AnimationPlayer
@onready var sprite = $Sprite2D as Sprite2D
@onready var detect_enemy: Area2D = $DetectEnemy as Area2D

var direction: Vector2
var enemy_target: Enemy


func _ready():
	direction = Utils.get_random_direction()
	anim.play("shoot")
	area_entered.connect(_on_area_entered)
	detect_enemy.body_entered.connect(_on_detect_enemy_entered)


func _on_detect_enemy_entered(enemy: Enemy):
	enemy_target = enemy


func _physics_process(delta):
	position += direction * speed * delta
	if global_position.distance_to(Game.player.global_position) >= 300:
		queue_free()
	if enemy_target:
		if not is_instance_valid(enemy_target):
			enemy_target = null
			return
		var target_direction = global_position.direction_to(enemy_target.global_position)
		direction = direction.lerp(target_direction, 0.1)
	look_at(global_position + direction)


func _on_area_entered(area: Area2D):
	if area is HurtBox:
		set_physics_process(false)
		anim.play("explode")
		await anim.animation_finished
		queue_free()
