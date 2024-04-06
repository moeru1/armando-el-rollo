extends CanvasLayer
@onready var button_sound = $ButtonSound
	
func _on_button_pressed():
	button_sound.play()
	get_tree().paused = false
	hide()


func _on_settings_button_pressed():
	button_sound.play()
	$Settings.show()
