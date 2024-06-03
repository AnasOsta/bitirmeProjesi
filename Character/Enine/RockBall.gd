extends CharacterBody2D

@export var path_follow : PathFollow2D
@export var speed : float = 60
@export var raitoNum : float = 0.98

var start : bool = false
func _process(delta):
	if start && path_follow.progress_ratio < raitoNum:
		path_follow.progress += speed * delta
		rotation += 5


func _on_area_2d_body_entered(body):
	start = true
