class_name Puncher extends CharacterBody2D

signal power_up_take
signal ball_punched

const SPEED = 600.0
var speed_modifier = 0
var initial_position_y

func _ready():
	initial_position_y = self.position.y

func _process(_delta):
	var direction = Input.get_axis("ui_left", "ui_right")

	if Input.is_key_pressed(KEY_SHIFT):
		speed_modifier = 150
	print(direction)
	if direction:
		if direction == -1:
			velocity.x = direction * SPEED + (speed_modifier * -1)
		else: 
			velocity.x = direction * SPEED + speed_modifier
	else:
		velocity.x = move_toward(velocity.x, 0, (SPEED + speed_modifier))
	print(velocity.x)
	move_and_slide()
	position.y = initial_position_y
	velocity.y = 0
	speed_modifier = 0

func reset_level():
	get_tree().reload_current_scene()

func _on_death_zone_body_entered(body):
	if body is Ball:
		reset_level()
