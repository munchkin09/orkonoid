extends Node2D

var path = 'res://src/Scenes/d_o_h_1.tscn'

func _ready():
	GameStateMachine.startStateMachine(self)

func _on_button_pressed():
	GameStateMachine.changeSceneTo(path)
