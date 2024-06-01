extends Node2D

var path1 = 'res://src/Scenes/Levels/d_o_h_1.tscn'
var path2 = 'res://src/Scenes/Levels/d_o_h_2.tscn'


func _ready():
	GameStateMachine.startStateMachine(self)

func _on_level_1_pressed():
	GameStateMachine.changeSceneTo(path1)


func _on_level_2_pressed():
	GameStateMachine.changeSceneTo(path2)
