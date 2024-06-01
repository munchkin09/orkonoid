class_name Brick extends CharacterBody2D

signal brick_hit

const COLORS_BRICKS = [
	'blue',
	'green',
	'orange'
]
@onready var sprite = $AnimatedSprite2D

func _ready():
	set_color()
	
func set_color():
	sprite.animation = COLORS_BRICKS[randi_range(0,2)]
