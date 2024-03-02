extends CanvasLayer

@onready var button_sound = $Panel/Button/ButtonSound

func _on_button_pressed():
	button_sound.play()
	LoadManager.load_scene(GlobalValues.menu_screen_path)
	MusicPlayer.play_song("Armando_Titlescreen_ost")
