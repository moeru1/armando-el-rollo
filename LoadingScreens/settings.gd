extends Panel

@export var button_sound:AudioStreamPlayer
@export var master_slider: HSlider
@export var music_slider: HSlider
@export var sfx_slider: HSlider

func _ready():
	var audio_settings = ConfigFileHandler.load_audio_settings()
	master_slider.value = audio_settings.Master
	music_slider.value = audio_settings.Music
	sfx_slider.value = audio_settings.Sfx
	
func _on_close_button_pressed():
	button_sound.play()
	hide()


func _on_master_slider_drag_ended(value_changed):
	if value_changed:
		ConfigFileHandler.save_audio_settings(master_slider.bus_name, master_slider.value)


func _on_music_slider_drag_ended(value_changed):
	if value_changed:
		ConfigFileHandler.save_audio_settings(music_slider.bus_name, music_slider.value)


func _on_sfx_slider_drag_ended(value_changed):
	if value_changed:
		ConfigFileHandler.save_audio_settings(sfx_slider.bus_name, sfx_slider.value)
