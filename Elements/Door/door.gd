extends AnimatedSprite2D

@export var endDoorPos : Vector2



func _on_area_2d_body_entered(body : CharacterBody2D):
	body.global_position = endDoorPos
	print("Hi")
