class_name DoH extends Node2D

var game_score: int = 0

@export var brick: PackedScene
@export var ball: PackedScene

func load_bricks_pattern(pattern):
	var initial = 0
	for ix: int in pattern.size():
		for iy: int in pattern[ix].size():
			if pattern[ix][iy] != '': 
				var new_brick = brick.instantiate() as Brick
				new_brick.connect('brick_hit', on_brick_hit)
				add_child(new_brick)
				new_brick.position = Vector2(118 * iy+1, 40 * ix +1)
				
				new_brick.setup(pattern[ix][iy])

func on_brick_hit(brick: Brick):
	if brick.remaining_hits == 0:
		brick.queue_free()
		return
	brick.update_remaining_hits()
