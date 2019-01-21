extends Area2D

export (int) var speed
export (int) var damage
export (float) var lifetime

var velocity = Vector2()

func start(_position, _direction):
	position = _position
	rotation = _direction.angle()
	$LifeTime.wait_time = lifetime
	$LifeTime.start()
	velocity = _direction * speed
	
func _process(delta):
	position += velocity * delta

func explode():
	velocity = Vector2()
	$Sprite.hide()
	$Explosion.show()
	$Explosion.play('smoke')

func _on_Bullet_body_entered(body):
	explode()
	if body.has_method("take_damage"):
		body.take_damage(damage)


func _on_LifeTime_timeout():
	explode()

func _on_Explosion_animation_finished():
	queue_free()