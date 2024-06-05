class_name PowerUp extends Node2D

signal applied_power_up
signal unapplied_power_up

var type: String

func _init(n: String, t: String):
	name = n
	type = t

func activate():
	pass

func deactivate():
	pass
