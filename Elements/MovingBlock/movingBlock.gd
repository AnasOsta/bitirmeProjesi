extends CharacterBody2D

@export var path_follow : PathFollow2D
@export var speed : float = 30

var start : bool = false
func _process(delta):
	if start:
		path_follow.progress += speed * delta


func _on_visible_on_screen_notifier_2d_screen_entered():
	start = true
