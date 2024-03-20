extends CanvasLayer

@onready var button_sound = $Panel/Button/ButtonSound
@onready var roll_score_label = $Roll_panel/GridContainer/RollScore
@onready var distance_traveled_label = $Distance
@onready var music_player = $Music

func update_labels():
	distance_traveled_label.set_text(str(GlobalValues.distance_traveled) + " M")
	roll_score_label.set_text(str(GlobalValues.score))

func _on_button_pressed():
	get_tree().paused = false
	button_sound.play()
	music_player.stop()
	LoadManager.load_scene(GlobalValues.menu_screen_path)
	MusicPlayer.play_song(GlobalValues.menu_music_path)
