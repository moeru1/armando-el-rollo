extends AudioStreamPlayer
@export var fading_scale: float = 30
@onready var dummy_player: AudioStreamPlayer = AudioStreamPlayer.new()
var fading: bool = false
# Called when the node enters the scene tree for the first time.
func _ready():
	add_child(dummy_player)
	stream = load("res://Assets/Audio/Soundtrack/Armando_Titlescreen_ost.wav")
	play()

func _process(delta):
	if fading:
		dummy_player.volume_db += delta*fading_scale
		volume_db -= delta*fading_scale
		if dummy_player.volume_db>=0:
			volume_db = 0
			dummy_player.volume_db = -60
			stream = dummy_player.stream
			play(dummy_player.get_playback_position())
			dummy_player.stop()
			fading = false
		
		
func play_song(song_name) -> void:
	dummy_player.stream = load("res://Assets/Audio/Soundtrack/" + song_name + ".wav")
	dummy_player.volume_db = -60
	dummy_player.play()
	fading = true
