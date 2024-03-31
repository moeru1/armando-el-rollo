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
	print("COLISION CHANCLA CON GRUPOS ", body.get_groups())
	if body.is_in_group("player"):
		var immune_layer = 6
		var player_layer = 4
		body.set_collision_layer_value(immune_layer, true)
		body.set_collision_layer_value(player_layer, false)
		#body.score += 100
		#print("Collected green bean")
		queue_free()
