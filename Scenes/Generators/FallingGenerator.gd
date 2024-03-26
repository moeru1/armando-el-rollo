extends Node3D


@export var amount: int = 15
@export var offset: int = 2
@export var pos_offset: Vector3 = Vector3(0,0,0)
@export var spawn_offset: int = 5
@export var spawn_objects: bool = false
@export var green_probability: int = 70
@export var chancla_probability: int = 5

var active: bool = false
var countdown:int = 0
#Loading Obstacle Scenes
var random_location: RandomLocation = RandomLocation.new()
var obstacle_types: Array[Callable] = [random_location.random_green]
var obs_count: int = 4


func spawn_tiles():
	var rand_int =  randi_range(1,100)
	var obstacle = null
	if (rand_int <= green_probability):
		obstacle = random_location.random_green
	elif (green_probability < rand_int && rand_int <= green_probability + chancla_probability):
		print("CHANCLA SELECTED!!!")
		obstacle = random_location.random_chancla
	if obstacle != null:
		var obs_instance = obstacle.call()
		add_child(obs_instance)

func _on_timer_timeout():
	active = true

func _on_spawn_cooldown_timeout():
	if not (active and spawn_objects): 
		return
	spawn_tiles()
	
		
