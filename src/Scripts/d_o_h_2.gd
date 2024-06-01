class_name DoH_2 extends DoH

const LEVEL_LAYOUT = [
	[],
	['', '*oh', '', '*oh', '', '', '*gs', '*gh', '', '', ''],
	['','*oh','', '*oh', '*oh', '', '*oh', '*oh', '', '*oh'],
	['','*gs','', '*gs', '*gs', '', '*gs', '*gs', '', '*gs'],
	['','*bh','', '*bh', '*bh', '', '*bh', '*bh', '', '*bh'],
	['','*bs','', '*bs', '*bs', '', '*bs', '*bs', '', '*bs'],
	['','*gs','', '*gs', '*os', '', '*os', '*gs', '', '*gs'],
	['','*os','', '*os', '*gs', '', '*gs', '*os', '', '*os']
]

func _ready():
	load_bricks_pattern(LEVEL_LAYOUT)

