extends CanvasLayer
@onready var button_sound = $ButtonSound
@onready var soundtrack_player: AudioStreamPlayer = $Soundtrack

func _ready():
	soundtrack_player.play()

func _on_play_button_pressed():
	button_sound.play()
	soundtrack_player.stop()
	LoadManager.load_scene("res://Scenes/World/level.tscn")


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
