extends CharacterBody2D
class_name canon_ball
@export var speed  = 20
@export var damage = 10
@export var dire : Vector2 = Vector2(-1, 0)
func _physics_process(delta):
	velocity = dire * speed * delta * 1000
	move_and_slide()


@warning_ignore("unused_parameter")
func _on_area_2d_body_entered(body):
	for child in body.get_children():
		if child is Damageable:
			
			var directionToDamageable = body.global_position - global_position
			var directionSign = sign(directionToDamageable.x)
			if directionSign > 0:
				child.hit(damage, Vector2.RIGHT)
			elif directionSign < 0:
				child.hit(damage, Vector2.LEFT)
			else:
				child.hit(damage, Vector2.ZERO)
	queue_free()


func _on_timer_timeout():
	queue_free()
