extends Area3D

@export var base_speed: float = 2
@export var del_distance: int = -1
var speed: float

func _ready():
	speed = base_speed * GlobalValues.speed_modif
	speed = clamp(speed, 1, 13)

func _process(delta):
	position.y -= speed * delta
	position.x -= speed * delta
	if position.y < del_distance:
		queue_free()


func _on_area3d_body_entered(body):
	const immune_sec = 5.0
	if body.is_in_group("player"):
		body.immune(immune_sec)
		queue_free()
