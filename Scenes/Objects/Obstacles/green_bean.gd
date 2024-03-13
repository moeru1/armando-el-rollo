extends Area3D

@export var base_speed: float = 6
@export var del_distance: int = -1
var speed: float

func _ready():
	speed = base_speed * GlobalValues.speed_modif
	speed = clamp(speed, 1, 13)

func _process(delta):
	position.y -= speed * delta
	if position.y < del_distance:
		queue_free()


func _on_area3d_body_entered(body):
	if body.is_in_group("player"):
		GlobalValues.high_score += 100
		print("Collected green bean")
		queue_free()
