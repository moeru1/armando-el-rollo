extends Node3D

@export var amount: int = 15
@export var offset: int = 2
@export var pos_offset: Vector3 = Vector3(0,0,0)
@export var spawn_offset: int = 5
@export var spawn_objects: bool = false
@export var cacti_probability : int = 70
@export var paper_probability: int = 30
@export var speed: float = 6.0

var active: bool = false
var countdown:int = 0
var random_location: RandomLocation = RandomLocation.new()

var obstacle_types: Array[Callable]  = [random_location.random_cacti, random_location.random_paper]
var obs_count: int = 4

func spawn_tiles():
	var rand_int =  randi_range(1,100)
	var obstacle = null
	if (rand_int <= cacti_probability):
		obstacle = random_location.random_cacti
	elif (cacti_probability < rand_int && rand_int <= cacti_probability + paper_probability):
		#print("SELECTED PAPER!!!")
		obstacle = random_location.random_paper
		
	if obstacle != null:
		var obs_instance = obstacle.call()
		add_child(obs_instance)
		
func _on_timer_timeout():
	active = true

func _on_spawn_cooldown_timeout():
	if active and spawn_objects:
		spawn_tiles()
