extends Node

class_name State

@export var can_move : bool = true
@export var can_jump : bool = true
@export var can_attack : bool = true
@export var can_double_jump : bool = true

var character : CharacterBody2D
var playback : AnimationNodeStateMachinePlayback
var next_state : State

signal interruptState(newState : State)

@warning_ignore("unused_parameter")
func state_process(delta):
	pass

@warning_ignore("unused_parameter")
func state_input(event : InputEvent):
	pass

func on_enter():
	pass
	
func on_exit():
	pass
