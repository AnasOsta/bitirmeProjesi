extends StaticBody2D

class_name Trap
var ss : CanvasLayer
@export var sceneStr : String = ""

func _on_area_2d_body_entered(body):
	$"../../GameOver/Menu".visible = true
	get_tree().paused = true
