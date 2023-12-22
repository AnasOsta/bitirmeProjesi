extends State

class_name GroundState

@export var JUMP_VELOCITY : float = -250.0
@export var air_state : State
@export var jump_animation : String = "jump"
@export var attack_state : State
@export var attack_animation : String = "attack1"

@onready var bufferTimer : Timer = $BufferTimer

@warning_ignore("unused_parameter")
func state_process(delta):
	if !character.is_on_floor() && bufferTimer.is_stopped():
		next_state = air_state

func state_input(event : InputEvent):
	if event.is_action_pressed("jump") && can_jump:
		jump()
	if can_attack && event.is_action_pressed("attack"):
		attack()

func jump():
	character.velocity.y = JUMP_VELOCITY
	next_state = air_state
	playback.travel(jump_animation)

func attack():
	next_state = attack_state
	playback.travel(attack_animation)
