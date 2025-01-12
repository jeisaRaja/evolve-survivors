extends Area2D
class_name Gem

@export var gem_res: GemResource
@onready var sprite: Sprite2D = $Sprite2D


func _ready():
	sprite.texture = gem_res.texture
