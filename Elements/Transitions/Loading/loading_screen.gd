extends CanvasLayer

signal  loading_screen_has_full_converage

@onready var animatoinPlayer : AnimationPlayer = $AnimationPlayer
@onready var progreesBar : ProgressBar = $Panel/ProgressBar
 

func _update_progress_bar(new_value : float):
	progreesBar.set_value_no_signal(new_value * 100)
	
func _start_outro_animation() -> void :
	await Signal(animatoinPlayer, "animation_finished")
	animatoinPlayer.play("end_load")
	await  Signal(animatoinPlayer, "animation_finished")
	self.queue_free()
