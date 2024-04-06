extends CanvasLayer
@onready var button_sound = $ButtonSound

func _on_continue_button_pressed():
	button_sound.play()
	get_tree().paused = false
	hide()


func _on_settings_button_pressed():
	button_sound.play()
	$Settings.show()




func _on_menu_button_pressed():
	get_tree().paused = false
	button_sound.play()
	LoadManager.load_scene(GlobalValues.menu_screen_path)
