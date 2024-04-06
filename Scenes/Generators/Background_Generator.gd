extends Node3D

@export var amount: int = 10
@export var offset: float = 2
@export var pos_offset: Vector3 = Vector3(0,0,0)
@export var active: bool = true
var item_path: String

@export var background_arr: Array[PackedScene]

# Called when the node enters the scene tree for the first time.
func _ready():
	for n in amount:
		for i in range(0,7):
			spawn_tiles(n*offset, i)

#res://Scenes/Objects/background.tscn
func spawn_tiles(n, layer):
	if active:
		var instance = background_arr[layer].instantiate()

		instance.position += pos_offset
		instance.position.x = n
		
		add_child(instance)
