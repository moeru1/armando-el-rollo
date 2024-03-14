extends CanvasLayer
@onready var score_label: Label = $"../UI/Socreboard/Score_panel/ScoreLabel"
@onready var roll_score_label: Label = $Socreboard/Roll_panel/GridContainer/RollScore

# Called when the node enters the scene tree for the first time.
func _ready():
	roll_score_label.set_text("{score}".format({"score": "0000"}))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	score_label	.set_text("{score}".format({"score": get_parent().score}))


func _on_pause_pressed():
	get_tree().paused = true
	$"../PauseMenu".show()
