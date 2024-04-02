extends CharacterBody3D

const immune_layer = 6
const player_layer = 4

@onready var soundtrack_player: AudioStreamPlayer = $Soundtrack
@onready var sound_manager: Node3D = $SoundEffects

@export var gravity:float = 12.0
@export var speed: float = 5.0
@export var jump_velocity: int = 7

@export var score_mult: float = 3.0

@onready var anim_player: AnimationTree = $AnimationTree
@onready var loss_screen_sceme: CanvasLayer = $loss_screen
@onready var UI: CanvasLayer = $UI
var loss_music_player: AudioStreamPlayer

var score: int = 0
var distance_traveled: int = 0
# Variables used for debug purposes
var is_immune: bool = false
var immune_remaining: float = 0

func _ready():
	loss_music_player =  loss_screen_sceme.find_child("Soundtrack")
	distance_traveled = 0
	soundtrack_player.play()

func _process(delta):
	distance_traveled += ceili(score_mult/10)
	#debug data
	if is_immune:
		display_immune_time(delta)

func _physics_process(delta):
	if not is_on_floor():
		velocity.y -= gravity * delta

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = jump_velocity

	var input_dir = Input.get_vector("ui_up", "ui_down", "left", "right")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		
	anim_player.set("parameters/conditions/jump", !is_on_floor() && velocity.y>0)
	anim_player.set("parameters/conditions/falling", !is_on_floor() && velocity.y<0)
	anim_player.set("parameters/conditions/landed", is_on_floor() && velocity.y==0)
	
	move_and_slide()

func lose():
	soundtrack_player.stop()
	UI.hide()
	get_tree().paused = true
	if score > GlobalValues.high_score:
		GlobalValues.high_score = score
	GlobalValues.distance_traveled = distance_traveled
	GlobalValues.score = score
	loss_screen_sceme.update_labels()
	loss_screen_sceme.show()
	loss_music_player.play()

func immune(time_sec: float):
	soundtrack_player.set_stream_paused(true)
	sound_manager.chancla()
	set_collision_layer_value(immune_layer, true)
	set_collision_layer_value(player_layer, false)
	is_immune = true
	immune_remaining = time_sec

	await get_tree().create_timer(time_sec, false).timeout
	set_collision_layer_value(immune_layer, false)
	set_collision_layer_value(player_layer, true)
	is_immune = false
	immune_remaining = 0.0
	
	soundtrack_player.set_stream_paused(false)
	
func display_immune_time(delta):
	print("Immune remaining time: ", immune_remaining)
	immune_remaining -= delta


