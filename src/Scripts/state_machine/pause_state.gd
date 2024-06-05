class_name PauseState extends BaseStateClass

var PauseMenu 
var root_node: Node2D
var paused


func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS

func enter():
	#Log.call("Greetings from pause")
	PauseMenu = root_node.get_tree().get_first_node_in_group('current_scene').get_node("PauseMenu")
	paused = true
	PauseMenu.show()
	PauseMenu.get_node("PauseGridContainer").show()
	root_node.get_tree().get_first_node_in_group('current_scene').get_tree().paused = paused

func exit():
	paused = false
	PauseMenu.get_node("SettingsGridContainer").hide()
	PauseMenu.hide()
	root_node.get_tree().get_first_node_in_group('current_scene').get_tree().paused = paused

func process(_delta):
	
	if Input.is_action_pressed('ui_menu'):
		pass
		#Transitioned.emit(self, 'startlevelstate')

func physics_process(_delta):
	pass
