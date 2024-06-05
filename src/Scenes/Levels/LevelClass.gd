class_name DoH extends Node2D

@export var brick: PackedScene
@export var ball: PackedScene

func load_bricks_pattern(pattern):
	for ix: int in pattern.size():
		for iy: int in pattern[ix].size():
			if pattern[ix][iy] != '': 
				var new_brick = brick.instantiate() as Brick

				add_child(new_brick)
				new_brick.connect('brick_hit', on_brick_hit)
				new_brick.position = Vector2(118 * iy, 40 * ix)
				new_brick.setup(pattern[ix][iy])


func on_brick_hit(brickHitted: Brick):
	brickHitted.update_remaining_hits()
	# Check if power_up should be drop
	GameStateMachine.update_score(brickHitted.brick_data)
	if brickHitted.remaining_hits == 0:
		brickHitted.queue_free()
		return
