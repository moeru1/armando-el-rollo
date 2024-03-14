extends CanvasLayer
@onready var button_sound = $Panel/Button/ButtonSound
	
func _on_button_pressed():
	button_sound.play()
	get_tree().paused = false
	hide()
