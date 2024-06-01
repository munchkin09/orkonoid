class_name DoH_1 extends DoH

const LEVEL_LAYOUT = [
	[],
	['','*oh', '*os', '*oh', '', '*gh', '*gs', '*gh', ''],
	['','*oh','*oh', '*oh', '*oh', '*oh', '*oh', '*oh', '*oh', '*oh'],
	['','*gs','*gs', '*gs', '*gs', '*gs', '*gs', '*gs', '*gs', '*gs'],
	['','*bh','*bh', '*bh', '*bh', '*bh', '*bh', '*bh', '*bh', '*bh'],
	['','*bs','*bs', '*bs', '*bs', '*bs', '*bs', '*bs', '*bs', '*bs'],
	['','*gs','*os', '*gs', '*os', '*gs', '*os', '*gs', '*os', '*gs'],
	['','*os','*gs', '*os', '*gs', '*os', '*gs', '*os', '*gs', '*os']
]

func _ready():
	load_bricks_pattern(LEVEL_LAYOUT)
