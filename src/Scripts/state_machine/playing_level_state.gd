class_name PlayingLevelState extends BaseStateClass

signal last_ball_lost
signal reset_ball

var remaining_tries = 3

func enter():
	remaining_tries = 3

func exit():
	pass

func process(_delta):
	if Input.is_action_pressed('ui_menu'):
		Transitioned.emit(self, 'pausestate')

func update_remaining_tries():
	remaining_tries -= 1

