class_name Brick extends CharacterBody2D

signal brick_hit
var remaining_hits: int = 1
@onready var sprite = $AnimatedSprite2D

const COLORS_BRICKS: Dictionary = {
	'b':'blue',
	'g':'green',
	'o':'orange'
}

const KIND_BRICKS: Dictionary = {
	's':'soft',
	'h':'hard',
	'u':'unbreakable'
}

const properties_per_brick: Dictionary = {
	'unbreakable': {
		
	}
}

var brick_data = {
}

func set_color(key: String):
	sprite.animation = key

func setup(data: String):
	brick_data = parserData(data)
	set_color(brick_data['formatted'])
	match brick_data['hardness']:
		'hard':
			remaining_hits = 2
		'unbreakable':
			remaining_hits = 1000

func update_remaining_hits():
	sprite.frame = 1
	remaining_hits -= 1


func parserData(data: String) -> Dictionary:
	var kind_brick = data[0]
	var color_brick = COLORS_BRICKS[data[1]]
	var hardness_brick = KIND_BRICKS[data[2]]
	var formed_brick = '%s_%s'
	brick_data = {
		'kind': kind_brick,
		'color': color_brick,
		'hardness': hardness_brick,
		'formatted': formed_brick % [color_brick, hardness_brick]
	}
	return brick_data
