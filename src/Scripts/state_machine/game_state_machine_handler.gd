class_name GameStateMachineHandler extends Node2D

var current_state
var states: Dictionary = {}
var history: Array[String] = []
var selectlevelstate = SelectLevelState.new()
var startlevelstate = StartLevelState.new()
var playinglevelstate = PlayingLevelState.new()
var pausestate = PauseState.new()
var initial_state = BaseStateClass.new()
var initial_menu = 'res://src/Scenes/Menu.tscn'

var DEBUG: bool = false
var ACTIVATE_HISTORY: bool = true
var PRINT_HISTORY: bool = true
const logDuckHeader = '🖥️🤖'
var score_manager
#var Log = func(msg, arg1 = null, arg2 = null, arg3 = null, arg4 = null, arg5 = null, arg6 = null):
#	LogDuck.d(logDuckHeader + msg, arg1, arg2, arg3, arg4, arg5, arg6)

func _ready():
	print("Ready begin on StateGameMachine", logDuckHeader)
	score_manager = ScoreManager.new()
	current_state = initial_state
	selectlevelstate.name = 'selectlevelstate'
	startlevelstate.name = 'startlevelstate'
	playinglevelstate.name = 'playinglevelstate'
	pausestate.name = 'pauselevelstate'
	
	initial_state.Transitioned.connect(on_child_transition)
	selectlevelstate.Transitioned.connect(on_child_transition)
	startlevelstate.Transitioned.connect(on_child_transition)
	playinglevelstate.Transitioned.connect(on_child_transition)
	pausestate.Transitioned.connect(on_child_transition)
	states['selectlevelstate'] = selectlevelstate
	states['startlevelstate'] = startlevelstate
	states['playinglevelstate'] = playinglevelstate
	states['pausestate'] = pausestate
	process_mode = Node.PROCESS_MODE_ALWAYS

func _process(delta):
	current_state.process(delta)

func _physics_process(delta):
	current_state.physics_process(delta)

func on_child_transition(state: BaseStateClass, newState: String):
	print('Changing to: ', newState)
	if state.name == newState:
		print(' from ', state.name)
		return

	var new_state = states.get(newState.to_lower())

	if !new_state:
		return

	if current_state:
		current_state.exit()
		print("Exiting:", current_state)
		print("called by: ", state.name)
		print("goint to: ", newState)
		history.append(current_state.to_string())

	current_state = new_state
	current_state.enter()

func states_history():
	if (ACTIVATE_HISTORY):
		history.append(current_state.name)

	if (PRINT_HISTORY):
		print('The state history so far: \n', history)

func startStateMachine(node: Node2D):
	pausestate.root_node = node
	selectlevelstate.setInitial(node)

func changeSceneTo(scene_path: String):
	selectlevelstate.setLevelTo(scene_path)
	print("EPE")
	current_state.Transitioned.emit(current_state, 'selectlevelstate')
	
func update_score(data: Dictionary):
	score_manager.update_score(data)
	
func power_up_taken():
	pass
