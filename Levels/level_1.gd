extends Node2D

const stream = preload("res://ost/09. In Darkness.mp3")
# Called when the node enters the scene tree for the first time.
func _ready():
	SceneMusic.play_music(stream)


# Called every frame. 'delta' is the elapsed time since the previous frame.
@warning_ignore("unused_parameter")
func _process(delta):
	pass
