extends Node2D

@export var levelName : PackedScene

@warning_ignore("unused_parameter")
func _on_area_2d_body_entered(body):
	LoadingManager.load_scene(levelName.resource_path)
