extends Node3D

@export var amount: int = 15
@export var offset: int = 2
@export var pos_offset: Vector3 = Vector3(0,0,0)
@export var spawn_offset: int = 5
@export var spawn_objects: bool = false
@export var speed: float = 6.0

var active: bool = false
var countdown:int = 0
var random_location: RandomLocation = RandomLocation.new()

var obstacle_types: Array[Callable]  = [random_location.random_cacti, random_location.random_paper]
var obs_count: int = 4
var obstacles: Array[SpawnableProb] = []
var spawnable_paper: Spawnable

func init_obstacles():
	var cacti_scene: PackedScene = preload("res://Scenes/Objects/Obstacles/cacti.tscn")
	var green_scene: PackedScene = preload("res://Scenes/Objects/Obstacles/green_bean.tscn")
	var paper_scene: PackedScene = preload("res://Scenes/Objects/Obstacles/toilet_paper.tscn")
	var chancla_scene: PackedScene = preload("res://Scenes/Objects/Obstacles/chancla.tscn")
	var huacal_scene: PackedScene = preload("res://Scenes/Objects/Obstacles/huacal.tscn")
	
	var cacti = SpawnableProb \
		.create(
			cacti_scene,
			Vector3(19, 0, 0),
			35
		)
	var huacal = SpawnableProb \
		.create(
			huacal_scene,
			Vector3(19, 0,0),
			35
		)
	var chancla = SpawnableProb \
		.create(
			chancla_scene,
			Vector3(19, 10, 0),
			5
		)
	var green_bean = SpawnableProb \
		.create(
			green_scene,
			Vector3(19, 10, 0),
			45
		)
	obstacles = [cacti, huacal, chancla, green_bean]
	spawnable_paper = Spawnable.create(paper_scene, Vector3(0,0,0))
	
func spawn_tiles():
	var rand_int =  randi_range(1,100)
	var obstacle = null
	print(rand_int)
	for spawn_prob in obstacles:
		var prob = spawn_prob.spawn_probability
		if rand_int <= prob:
			obstacle = spawn_prob.spawnable
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
			#toilet_paper.position.x = 
			toilet_paper.position.x = obs_instance.position.x
			toilet_paper.position.x += available_positions[i]
			toilet_paper.position.x += 3
			add_child(toilet_paper)
		obs_instance.position.x += 3
		print("MY POSITION: ", obs_instance.position)
		add_child(obs_instance)
		
		
func _on_timer_timeout():
	if !spawn_objects:
		return
	init_obstacles()
	while true:
		#spawn object btween (0.5, 1) seconds
		var time_next_object = 0.8 + randf() 
		await get_tree().create_timer(time_next_object, false).timeout
		spawn_tiles()
