extends Panel

@export var button_sound:AudioStreamPlayer

func _on_close_button_pressed():
	button_sound.play()
	hide()
