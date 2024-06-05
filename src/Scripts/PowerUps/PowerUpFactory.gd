extends Node2D

var multi_ball: MultiBall

func build_power_up() -> PowerUp:
	return MultiBall.new('multi','multi_ball')
