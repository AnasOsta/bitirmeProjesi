extends StaticBody2D

class_name Trap
var ss : CanvasLayer
@export var sceneStr : String = ""
@export var gameOver : CanvasLayer

@warning_ignore("unused_parameter")
func _on_area_2d_body_entered(body):
	gameOver.visible = true
	get_tree().paused = true
