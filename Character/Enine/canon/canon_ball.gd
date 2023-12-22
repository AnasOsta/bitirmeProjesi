extends CharacterBody2D
class_name canon_ball
var speed  = 20000
var damage = 10
func _physics_process(delta):
	velocity = Vector2(-1, 0) * speed * delta
	move_and_slide()


func _on_area_2d_body_entered(body):
	for child in body.get_children():
		if child is Damageable:
			
			var directionToDamageable = body.global_position - get_parent().global_position
			var directionSign = sign(directionToDamageable.x)
			set_collision_mask_value(1, false)
			if directionSign > 0:
				child.hit(damage, Vector2.RIGHT)
			elif directionSign < 0:
				child.hit(damage, Vector2.LEFT)
			else:
				child.hit(damage, Vector2.ZERO)


func _on_timer_timeout():
	queue_free()
