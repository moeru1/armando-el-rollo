class_name Spawnable 
extends Resource

var aabb : AABB
var scene: PackedScene
var default_position: Vector3 = Vector3(0,0,0)

static func create(scene: PackedScene, position: Vector3) -> Spawnable:
	var spawnable = Spawnable.new()
	spawnable.scene = scene
	spawnable.default_position = position
	return spawnable
	
func instantiate():
	var obj: Node = scene.instantiate()
	if default_position.x != 0:
		obj.position.x = default_position.x
	if default_position.y != 0:
		obj.position.y = default_position.y
	if default_position.z != 0:
		obj.position.z = default_position.z
	return obj
