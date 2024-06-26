extends CanvasLayer
@onready var button_sound = $ButtonSound
@export var gameplay_ui: CanvasLayer

func _on_continue_button_pressed():
	button_sound.play()
	get_tree().paused = false
	hide()
	gameplay_ui.show()


func _on_settings_button_pressed():
	button_sound.play()
	$Settings.show()


func _on_menu_button_pressed():
	get_tree().paused = false
	button_sound.play()
	LoadManager.load_scene(GlobalValues.menu_screen_path)
