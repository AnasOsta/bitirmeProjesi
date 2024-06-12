extends StaticBody2D

func open():
	var sprite : AnimatedSprite2D = $AnimatedSprite2D
	sprite.play("Open")
	set_collision_layer_value(2, false)
	set_collision_layer_value(6, false)
	GameValue.smallMap += 1
	$AnimatedSprite2D2.play("Map%d" % GameValue.smallMap)


func _on_animated_sprite_2d_2_animation_finished():
	$AudioStreamPlayer.play()
	$AnimatedSprite2D2.queue_free()
