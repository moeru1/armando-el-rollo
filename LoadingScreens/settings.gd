extends Panel

@onready var button_sound = $ButtonSound


func _on_close_button_pressed():
	button_sound.play()
	hide()
