class_name SpawnableProb
extends Resource 

var spawnable: Spawnable
var spawn_probability: int

static func create(scene: PackedScene, position: Vector3, spawn_probabilty: int) -> SpawnableProb:
	var spawnable = Spawnable.create(scene, position)
	var spawnable_prob = SpawnableProb.new()
	spawnable_prob.spawnable = spawnable
	spawnable_prob.spawn_probability = spawn_probabilty
	return spawnable_prob
