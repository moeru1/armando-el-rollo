extends Area3D

@export var speed: float = 6
@export var del_distance: int = 15

var new_speed: float

func _process(delta):
	new_speed = speed*GlobalValues.speed_modif
	new_speed = clamp(new_speed, 1, 13)
	position.x -= new_speed*delta
	if position.x < -del_distance:
		queue_free()


func _on_area3d_body_entered(body):
	if body.is_in_group("player"):
		body.score += 50
		#print("Collected green bean")
		queue_free()
