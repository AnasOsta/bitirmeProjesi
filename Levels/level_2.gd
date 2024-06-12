extends Node2D

const music1 = preload("res://ost/10. Justice.mp3")
const music2 = preload("res://ost/131. END OF THE LINE_.mp3")
@export var dark : CanvasModulate
@export var light : PointLight2D
# Called when the node enters the scene tree for the first time.
func _ready():
	SceneMusic.play_music(music1)

@warning_ignore("unused_parameter")
func _on_join_body_entered(body):
	dark.visible = true
	light.visible = true
	SceneMusic.play_music(music2)


@warning_ignore("unused_parameter")
func _on_exit_body_entered(body):
	dark.visible = false
	light.visible = false
	SceneMusic.play_music(music1)
