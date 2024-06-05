class_name Ball extends CharacterBody2D

const BOUNCE_VALUE = -600
const initial_position = Vector2(581,684)

var my_direction = -90
func _ready():
	velocity = Vector2(0.0, BOUNCE_VALUE)

func _physics_process(delta):
	var collision: KinematicCollision2D = move_and_collide(velocity * delta)
	if collision:
		if collision.get_collider() is Brick:
			collision.get_collider().brick_hit.emit(collision.get_collider())
		var reflect = collision.get_remainder().bounce(collision.get_normal())
		velocity = velocity.bounce(collision.get_normal())
		move_and_collide(reflect)

func reset_ball():
	velocity = Vector2(0.0, BOUNCE_VALUE)
	position = Vector2(get_parent().get_node('Puncher').global_position.x, get_parent().get_node('Puncher').global_position.y - 20 )
