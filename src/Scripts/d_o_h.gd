class_name DoH_1 extends Node2D

const LEVEL_LAYOUT = [
	[],
	['','*', '*', '*', '', '*', '*', '', '*'],
	['','*','*', '*', '*', '*', '*', '*', '*', '*'],
	['','*','*', '*', '*', '*', '*', '*', '*', '*'],
	['','*','*', '*', '*', '*', '*', '*', '*', '*'],
	['','*','*', '*', '*', '*', '*', '*', '*', '*'],
	['','*','*', '*', '*', '*', '*', '*', '*', '*'],
	['','*','*', '*', '*', '*', '*', '*', '*', '*']
]
@export var brick: PackedScene
@export var ball: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	load_bricks_pattern()

func load_bricks_pattern():
	var initial = 0
	for ix: int in LEVEL_LAYOUT.size():
		for iy: int in LEVEL_LAYOUT[ix].size():
			if LEVEL_LAYOUT[ix][iy] == '*': 
				var new_brick = brick.instantiate() as Brick
				new_brick.connect('brick_hit', on_brick_hit)
				new_brick.position = Vector2(118 * iy+1, 40 * ix +1)
				add_child(new_brick)

func on_brick_hit(brick: Brick):
	brick.queue_free()
