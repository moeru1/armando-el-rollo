extends Area3D
@export var sprite: Sprite3D
@export var speed: float = 6
@export var del_distance: int = 15
@onready var sound_player: AudioStreamPlayer = $AudioStreamPlayer
var new_speed: float

func _process(delta):
	sprite.position.y += sin(delta)*0.15
	new_speed = speed*GlobalValues.speed_modif
	new_speed = clamp(new_speed, 1, 20)
	position.x -= new_speed*delta
	if position.x < -del_distance:
		queue_free()


func _on_area3d_body_entered(body):
	if body.is_in_group("player"):
		sound_player.play()
		body.score += 50
		body.sound_manager.papel()
		#print("Collected green bean")
		queue_free()
