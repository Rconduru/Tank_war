extends Node2D

var bar_red = preload("res://Assets/UI/health_bar_red.png")
var bar_green = preload("res://Assets/UI/health_bar.png")
var bar_texture

func _ready():
	for node in get_children():
		node.hide()
		
func _process(delta):
	global_rotation = 0

func update_healthbar(value):
	
	$HealthBar.texture_progress = bar_green
	
	if value < 50:
		$HealthBar.texture_progress = bar_red
	
	if value < 100:
		$HealthBar.show()
		
	$HealthBar.value = value