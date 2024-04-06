extends Area3D

@export var base_speed: float = 2
@export var del_distance: int = -1
@export var mesh: MeshInstance3D
@export var rotation_speed: float = 1.0

var speed: float

func _ready():
	speed = base_speed * GlobalValues.speed_modif
	speed = clamp(speed, 1, 13)

func _process(delta):
	mesh.rotate_y(rotation_speed*delta)
	position.y -= speed * delta
	position.x -= speed * delta
	if position.y < del_distance:
		queue_free()


func _on_area3d_body_entered(body):
	const immune_sec = 5.0
	if body.is_in_group("player"):
		body.immune(immune_sec)
		#print("IMMUNE ENDED")
		queue_free()
