extends CanvasLayer
@onready var button_sound = $Panel/Button/ButtonSound
func _on_button_pressed():
	button_sound.play()
	LoadManager.load_scene("res://Scenes/World/level.tscn")
	MusicPlayer.play_song(GlobalValues.gameplay_music_path)
