extends Node3D

@onready var generator = get_parent()
@export var speed: float = 10
@export var del_distance: int = 15

func _process(delta):
	position.x -= speed*delta
	if position.x < -del_distance:
		generator.spawn_tiles(position.x+(generator.amount*generator.offset))
		queue_free()


func _on_area_3d_body_entered(body):
	if body.is_in_group("player"):
		LoadManager.load_scene(GlobalValues.loss_screen_path)
		MusicPlayer.play_song("Armando_Gameover_ost")
		if GlobalValues.score > GlobalValues.high_score:
			GlobalValues.high_score = GlobalValues.score
		GlobalValues.score = 0
