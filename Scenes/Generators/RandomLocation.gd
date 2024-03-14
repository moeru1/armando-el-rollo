class_name RandomLocation # extends RefCounted, so it won't show up in the node creation dialog.
extends RefCounted

var cacti_scene: PackedScene = preload("res://Scenes/Objects/Obstacles/cacti.tscn")
var green_scene: PackedScene = preload("res://Scenes/Objects/Obstacles/green_bean.tscn")

func random_cacti():
	var obj = cacti_scene.instantiate()
	obj.position.x = 19
	return obj

func random_green():
	var obj = green_scene.instantiate()
	var rand_x = randi_range(1, 19)
	obj.position.x = rand_x
	obj.position.y = 10
	return obj
