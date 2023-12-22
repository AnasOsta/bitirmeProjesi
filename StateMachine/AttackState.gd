extends State

@export var return_state : State
@export var return_animation_node : String = "move"
@export var attack1_animation : String = "attack1"
@export var attack2_animation : String = "attack2"
@export var attack3_animation : String = "attack3"
@onready var timer : Timer = $Timer

func state_input(event : InputEvent):
	if event.is_action_pressed("attack") :
		timer.start()

func _on_animation_tree_animation_finished(anim_name):
	if anim_name == attack1_animation :
		if timer.is_stopped() :
			next_state = return_state
			playback.travel(return_animation_node)
		else :
			playback.travel(attack2_animation)
	elif anim_name == attack2_animation :
		if timer.is_stopped() :
			next_state = return_state
			playback.travel(return_animation_node)
		else :
			playback.travel(attack3_animation)
	if anim_name == attack3_animation:
		next_state = return_state
		playback.travel(return_animation_node)
