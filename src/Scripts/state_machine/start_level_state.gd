class_name StartLevelState extends BaseStateClass

var timer = Timer.new()

func enter():
	print('Greetings from start level!')
	Transitioned.emit(self, 'playinglevelstate')

func exit():
	super()

func physics_process(_delta):
	pass

