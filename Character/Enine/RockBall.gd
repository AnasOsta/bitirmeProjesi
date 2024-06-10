extends CharacterBody2D

@export var path_follow : PathFollow2D
@export var speed : float = 60
@export var raitoNum : float = 1

var start : bool = false
func _process(delta):
	if start && path_follow.progress_ratio < raitoNum:
		path_follow.progress += speed * delta
		rotation -= 25

@warning_ignore("unused_parameter")
func _on_area_2d_body_entered(body):
	start = true
