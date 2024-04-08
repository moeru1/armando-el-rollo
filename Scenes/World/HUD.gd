extends CanvasLayer

@export var score_label: Label
@export var distance_label: Label
@export var high_score_label: Label

func _process(delta):
	score_label.set_text("{score}".format({"score": get_parent().score}))
	distance_label	.set_text("{distance} M".format({"distance": get_parent().distance_traveled}))
	high_score_label.set_text("{distance} M".format({"distance": GlobalValues.top_distance_traveled}))


func _on_pause_pressed():
	get_tree().paused = true
	$"../PauseMenu".show()
