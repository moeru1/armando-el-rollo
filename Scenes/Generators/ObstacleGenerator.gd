extends Node3D

var cacti = preload("res://Obstacles/cacti.tscn")
var obstacle_types:Array = [cacti]
var obstacles: Array
var last_obs

func spawn_obstacle():
	if obstacles.is_empty():
		var obs_type = obstacle_types[randi() % obstacle_types.size()]
		var obs = obs_type.instantiate()
		last_obs = obs
		add_child(obs)
		obstacles.append(obs)
