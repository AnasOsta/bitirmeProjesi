extends StaticBody2D

func open():
	var sprite : AnimatedSprite2D = $AnimatedSprite2D
	sprite.play("Open")
	set_collision_layer_value(2, false)
	set_collision_layer_value(6, false)	
