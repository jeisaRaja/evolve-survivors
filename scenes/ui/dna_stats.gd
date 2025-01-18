extends VBoxContainer

@export var player_dna_stats: DnaStats
@onready var str_label = $Str/Label as Label
@onready var agi_label = $Agi/Label as Label
@onready var int_label = $Int/Label as Label


func _ready():
	Event.player_dna_stats_updated.connect(_on_dna_stats_updated)


func _on_dna_stats_updated():
	str_label.text = str(player_dna_stats.str_points)
	agi_label.text = str(player_dna_stats.agi_points)
	int_label.text = str(player_dna_stats.int_points)
