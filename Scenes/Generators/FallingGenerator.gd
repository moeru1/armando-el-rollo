extends Node3D

@onready var level_node: Node3D = $"../.."

@export var amount: int = 15
@export var offset: int = 2
@export var pos_offset: Vector3 = Vector3(0,0,0)
@export var spawn_offset: int = 5
@export var spawn_objects: bool = false
@export var spawn_probability: int = 70

var active: bool = false
var countdown:int = 0

#Loading Obstacle Scenes
var green_scene: PackedScene = preload("res://Scenes/Objects/Obstacles/green_bean.tscn")
var obstacle_types: Array[PackedScene] = [green_scene]
var obs_count: int = 4

func spawn_tiles(x, y):
	var rand_int =  randi_range(1,100)
	if (rand_int <= spawn_probability):
		var obstacle = obstacle_types[randi() % obstacle_types.size()]
		var obs_instance = obstacle.instantiate()
		obs_instance.position.x = x
		obs_instance.position.y = y
		add_child(obs_instance)

func _on_timer_timeout():
	active = true

func _on_spawn_cooldown_timeout():
	if not (active and spawn_objects): 
		return
	var rand_int =  randi_range(1,100)
	if (rand_int > spawn_probability):
		return
	var rand_x = randi_range(1, 19)
	spawn_tiles(rand_x, 10)
	
		
