extends CanvasLayer
@onready var score_label: Label = $Score
@onready var h_score_label: Label = $High_score

# Called when the node enters the scene tree for the first time.
func _ready():
	h_score_label.set_text("High score: {score}".format({"score": GlobalValues.high_score}))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	score_label	.set_text("Score: {score}".format({"score": get_parent().score}))
