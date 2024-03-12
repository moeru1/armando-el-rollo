extends Node3D

var active: bool = false
@export var factor: float = 0.05

var acceleration = 0.001

#coment

func _process(delta):
	if active:
		GlobalValues.speed_modif += acceleration

func _on_timer_timeout():
	active = true
