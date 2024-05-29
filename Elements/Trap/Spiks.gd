extends StaticBody2D

class_name Trap
var ss : CanvasLayer
@export var sceneStr : String = ""
@export var gameOver : CanvasLayer

func _on_area_2d_body_entered(body):
	gameOver.visible = true
	get_tree().paused = true
