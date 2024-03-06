extends CanvasLayer

signal loading_screen_has_full_coverage

@onready var animationPlayer: AnimationPlayer = $AnimationPlayer
@onready var progress_bar: ProgressBar = $Panel/ProgressBar
@onready var panel: Panel = $Panel
func _update_progress_bar(new_value: float) -> void:
	progress_bar.set_value_no_signal(new_value*100)

func _start_outro_animation() -> void:
	animationPlayer.play("end_load")
	await Signal(animationPlayer, "animation_finished")
	self.queue_free()
