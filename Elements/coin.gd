extends Node2D

@export var score : int = 1
const  stream = preload("res://sound effect/collectcoin-6075.mp3")

@onready var area : Area2D = $Area2D

@warning_ignore("unused_parameter")
func _on_area_2d_body_entered(body):
	$AnimatedSprite2D.play("effect")
	GameValue.score += score
	area.set_deferred("monitoring", false)
	$AudioStreamPlayer2D.stream = stream
	$AudioStreamPlayer2D.play()


func _on_animated_sprite_2d_animation_finished():
	queue_free()
