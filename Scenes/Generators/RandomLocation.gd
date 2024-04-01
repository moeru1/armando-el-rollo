class_name RandomLocation # extends RefCounted, so it won't show up in the node creation dialog.
extends RefCounted

var cacti_scene: PackedScene = preload("res://Scenes/Objects/Obstacles/cacti.tscn")
var green_scene: PackedScene = preload("res://Scenes/Objects/Obstacles/green_bean.tscn")
var paper_scene: PackedScene = preload("res://Scenes/Objects/Obstacles/toilet_paper.tscn")
var chancla_scene: PackedScene = preload("res://Scenes/Objects/Obstacles/chancla.tscn")

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

func random_paper():
	print("PAPER SPAWNED!!!!")
	var obj = paper_scene.instantiate()
	obj.position.x = 19
	return obj

func random_chancla():
	var obj = chancla_scene.instantiate()
	var rand_x = randi_range(1, 19)
	obj.position.x = rand_x
	obj.position.y = 10
	return obj
