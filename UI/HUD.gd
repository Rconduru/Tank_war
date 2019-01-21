extends CanvasLayer

var bar_red = preload("res://Assets/UI/health_bar_red.png")
var bar_green = preload("res://Assets/UI/health_bar.png")
var bar_texture

func update_healthbar(value):
	bar_texture = bar_green
	
	if value < 50:
		bar_texture = bar_red
	$Margin/Container/HealthBar.texture_progress = bar_texture
	$Margin/Container/HealthBar/Tween.interpolate_property($Margin/Container/HealthBar,
			'value', $Margin/Container/HealthBar.value, value, 0.2, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$Margin/Container/HealthBar/Tween.start()
	$AnimationPlayer.play("healthbar_flash")

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == 'healthbar_flash':
		$Margin/Container/HealthBar.texture_progress = bar_texture
