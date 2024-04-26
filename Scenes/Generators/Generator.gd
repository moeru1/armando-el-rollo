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
@export var spawnables: Array[SpawnableProb]

var spawnable_paper: Spawnable = preload("res://Data/Spawnable/paper.tres")
var active: bool = false
var countdown:int = 0

var obs_count: int = 4

func spawn_tiles():
	var rand_int =  randi_range(1,100)
	var obstacle = null
	for spawnable in spawnables:
		var prob = spawnable.spawn_probability
		if rand_int <= prob:
			obstacle = spawnable.spawnable
			break
		rand_int -= prob
	
	if obstacle != null:
		var obs_instance = obstacle.instantiate()
		var num_toilet_paper = randi_range(0,3)
		var distance_to_obstacle = 2
		var available_positions = [-3, -2, -1, 1, 2]
		available_positions.shuffle()
		for i in range(num_toilet_paper):
			var toilet_paper = spawnable_paper.instantiate()
			var position = available_positions[i]
			var half_size: float = obstacle.aabb.size.x / 2
			#toilet_paper.position.x += half_size if position > 0 else -half_size
			toilet_paper.position.x += available_positions[i]
			toilet_paper.position.x += 3
			add_child(toilet_paper)
		obs_instance.position.x += 3
		add_child(obs_instance)
		
func _on_timer_timeout():
	if !spawn_objects:
		return
	while true:
		#spawn object between (0.5, 1) seconds
		var time_next_object = 0.8 + randf() 
		await get_tree().create_timer(time_next_object, false).timeout
		spawn_tiles()
