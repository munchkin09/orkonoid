class_name Brick extends CharacterBody2D

signal brick_hit
var remaining_hits: int = 1

const COLORS_BRICKS: Dictionary = {
	'b':'blue',
	'g':'green',
	'o':'orange'
}
const KIND_BRICKS: Dictionary = {
	's':'soft',
	'h':'hard',
	'o':'orange'
}

@onready var sprite = $AnimatedSprite2D

func _ready():
	pass
	
func set_color(key: String):
	sprite.animation = COLORS_BRICKS[key]

func setup(data: String):
	var color_brick = COLORS_BRICKS[data[1]]
	var hardness_brick = KIND_BRICKS[data[2]]
	var formed_brick = '%s_%s'
	var formatter_brick_setup = formed_brick % [color_brick, hardness_brick]
	sprite.animation = formatter_brick_setup
	if hardness_brick == 'hard':
		remaining_hits = 2

func update_remaining_hits():
	sprite.frame = 1
	remaining_hits -= 1
