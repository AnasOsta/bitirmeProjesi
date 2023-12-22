extends Node2D

func _ready():
	$Player.state_machine.current_state.can_move = false
