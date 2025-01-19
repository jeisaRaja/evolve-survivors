extends PlayerHitbox
class_name StartingSkill

@onready var animation_player = $AnimationPlayer as AnimationPlayer
@onready var hitbox = $CollisionShape2D as CollisionShape2D

var time_treshold := 1.2
var time_since_last_attack := 0.0


func _ready():
	hitbox.disabled = true
	animation_player.animation_finished.connect(_on_animation_finished)


func _physics_process(delta):
	time_since_last_attack += delta
	if time_since_last_attack >= time_treshold:
		animation_player.play("attack")
		time_since_last_attack = 0
		hitbox.disabled = false


func _on_animation_finished(_arg1):
	hitbox.disabled = true
