extends Node3D

@onready var generator = get_parent()
@export var speed: float = 10
@export var del_distance: int = 20
@export var id: int

func _process(delta):
	position.x -= speed*delta
	if position.x < -del_distance:
		generator.spawn_tiles(position.x+(generator.amount*generator.offset), id)
		queue_free()
