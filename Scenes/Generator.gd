extends Node3D

@export var amount: int = 15
@export var offset: int = 2
@export var pos_offset: Vector3 = Vector3(0,0,0)
@export var spawn_offset: int = 5
@export var spawn_objects: bool = false
var active: bool = false
var countdown:int = 0

var obs_count: int = 4
#Loading Obstacle Scenes
var cacti_scene: PackedScene = preload("res://Obstacles/cacti.tscn")

var obstacle_types: Array[PackedScene] = [cacti_scene]
var obstacles: Array

var count: int = 0

func _process(delta):
	if active and spawn_objects:
		spawn_tiles(count*offset)
		count+=1

func spawn_tiles(n):
	var rand_int = randi_range(1,100)
	if (rand_int >= 60 and obs_count <= 0):
		var obstacle = obstacle_types[randi() % obstacle_types.size()]
		var obs_instance = obstacle.instantiate()
		obs_instance.position += pos_offset
		obs_instance.position.x = n
		add_child(obs_instance)
		obstacles.append(obstacle)
		obs_count = 2
	else:
		obs_count -=1


func _on_timer_timeout():
	active = true
