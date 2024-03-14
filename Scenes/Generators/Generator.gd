extends Node3D

@onready var level_node: Node3D = $"../.."

@export var amount: int = 15
@export var offset: int = 2
@export var pos_offset: Vector3 = Vector3(0,0,0)
@export var spawn_offset: int = 5
@export var spawn_objects: bool = false
@export var spawn_probability: int = 70
@export var speed: float = 6.0

var active: bool = false
var countdown:int = 0
var random_location: RandomLocation = RandomLocation.new()

#Loading Obstacle Scenes
var cacti_scene: PackedScene = preload("res://Scenes/Objects/Obstacles/cacti.tscn")
var obstacle_types: Array[Callable]  = [random_location.random_cacti, random_location.random_green]
var obs_count: int = 4

func spawn_tiles():
	var rand_int =  randi_range(1,100)
	if (rand_int <= spawn_probability):
		var obstacle = obstacle_types[randi() % obstacle_types.size()]
		var obs_instance = obstacle.call()
		add_child(obs_instance)

func _on_timer_timeout():
	active = true

func _on_spawn_cooldown_timeout():
	if active and spawn_objects:
		spawn_tiles()
