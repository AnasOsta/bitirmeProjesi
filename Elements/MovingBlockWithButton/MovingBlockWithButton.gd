extends StaticBody2D


@export var path_follow : PathFollow2D
@export var speed : float = 30

var start : bool = false
var key : bool = false

func _process(delta):
	if start:
		path_follow.progress += speed * delta


func _on_area_2d_body_entered(body):
	if key:
		$"../../Button".play("effect")
		$"../../Button/Area2D".set_deferred("monitoring", false)
		start = true


func _on_key_body_entered(body):
	$Key.play("effect")


func _on_key_animation_finished():
	key = true
	$Key/Area2D.set_deferred("monitoring", false)
