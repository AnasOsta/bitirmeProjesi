extends CharacterBody2D
class_name canon_ball
@export var speed  = 20
@export var damage = 10
@export var dire : Vector2 = Vector2(-1, 0)
func _physics_process(delta):
	velocity = dire * speed * delta * 1000
	move_and_slide()


func _on_area_2d_body_entered(body):
	$"../../../GameOver/Menu".visible = true


func _on_timer_timeout():
	queue_free()
