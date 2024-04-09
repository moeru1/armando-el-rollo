extends Node3D

@export var amount: int = 15
@export var offset: int = 2
@export var pos_offset: Vector3 = Vector3(0,0,0)
@export var spawn_offset: int = 5
@export var spawn_objects: bool = false
@export var cacti_probability : int = 45
@export var huacal_probability: int = 25
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
	if rand_int <= cacti_probability:
		obstacle = random_location.random_cacti
	elif rand_int <= cacti_probability + huacal_probability:
		obstacle = random_location.random_huacal
	elif (rand_int <= cacti_probability + huacal_probability + paper_probability):
		obstacle = random_location.random_paper
	if obstacle != null:
		var obs_instance = obstacle.call()
		add_child(obs_instance)
		
func _on_timer_timeout():
	if !spawn_objects:
		return
	while true:
		#spawn object between (0.5, 1) seconds
		var time_next_object = 0.8 + randf() 
		await get_tree().create_timer(time_next_object, false).timeout
		spawn_tiles()
