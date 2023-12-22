extends StaticBody2D


@export var path_follow : PathFollow2D
@export var speed : float = 30

var start : bool = false
func _process(delta):
	if start:
		path_follow.progress += speed * delta


func _on_area_2d_body_entered(body):
	start = true
	$Button.visible = false
