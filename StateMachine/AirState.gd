extends State

class_name AirState

@export var landing_state : State
@export var DOUBLE_JUMP_VELOCITY : float = -200.0
@export var double_jump_animation : String = "double_jump"
@export var landing_animation_name : String = "Landing"
@export var falling : String = "fall"

var has_double_jumped : bool = false

@warning_ignore("unused_parameter")
func state_process(delta):
	if character.is_on_floor():
		next_state = landing_state
	else:
		if character.velocity.y > 0:
			fall()

func state_input(event : InputEvent):
	if event.is_action_pressed("jump") && !has_double_jumped && can_double_jump:
		double_jump()
func on_exit():
	if next_state == landing_state:
		playback.travel(landing_animation_name)
		has_double_jumped = false
func fall():
	playback.travel(falling)
func double_jump():
	character.velocity.y = DOUBLE_JUMP_VELOCITY
	playback.travel(double_jump_animation)
	has_double_jumped = true
