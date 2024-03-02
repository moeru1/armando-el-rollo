extends Node3D

@export var amount: int = 10
@export var offset: float = 2
@export var item: String
@export var pos_offset: Vector3 = Vector3(0,0,0)
@export var active: bool = true
var item_path: String



# Called when the node enters the scene tree for the first time.
func _ready():
	item_path= "res://Scenes/{str}.tscn".format({"str": item})
	for n in amount:
		spawn_tiles(n*offset)


func spawn_tiles(n):
	if active:
		var instance = load(item_path).instantiate()
		instance.position += pos_offset
		instance.position.x = n
		add_child(instance)
