extends CharacterBody3D

@export var gravity:float = 12.0
@export var speed: float = 5.0
@export var jump_velocity: int = 7

@export var score_mult: float = 3.0

@onready var anim_player: AnimationTree = $AnimationTree

var score: int = 0

func _ready():
	score = 0

func _process(delta):
	add_score(ceili(score_mult/10))

func process_high_score():
	if score > GlobalValues.high_score:
		GlobalValues.high_score = score

func add_score(points):
	score += points

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
