class_name Ball extends CharacterBody2D

const BOUNCE_VALUE = -600

var my_direction = -90
func _ready():
	velocity = Vector2(0.0, BOUNCE_VALUE)

func _physics_process(delta):
	var collision: KinematicCollision2D = move_and_collide(velocity * delta)
	if collision:
		if collision.get_collider() is Brick:
			collision.get_collider().brick_hit.emit(collision.get_collider())
		var reflect = collision.get_remainder().bounce(collision.get_normal())
		print(reflect)
		velocity = velocity.bounce(collision.get_normal())
		move_and_collide(reflect)
		
