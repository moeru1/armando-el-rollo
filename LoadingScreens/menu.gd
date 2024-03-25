extends CanvasLayer
@onready var button_sound = $ButtonSound

func _on_play_button_pressed():
	button_sound.play()
	LoadManager.load_scene("res://Scenes/World/level.tscn")
	MusicPlayer.play_song(GlobalValues.gameplay_music_path)


func _on_quests_button_pressed():
	button_sound.play()


func _on_store_button_pressed():
	button_sound.play()


func _on_profile_button_pressed():
	button_sound.play()


func _on_settings_button_pressed():
	button_sound.play()


func _on_exit_button_pressed():
	button_sound.play()
	get_tree().quit()
