extends TextureProgressBar


func _ready():
	Event.player_health_updated.connect(_on_player_health_updated)


func _on_player_health_updated(health: float):
	value = health
