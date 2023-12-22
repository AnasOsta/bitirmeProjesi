extends CharacterBody2D

@export var speed : float = 50
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var fall : bool = false
var fall1 : bool = false

func _physics_process(delta):
	if fall:
		velocity.y += speed * delta
	elif  fall1:
		velocity.y += gravity * delta
	move_and_slide()

@warning_ignore("unused_parameter")
func _on_area_2d_body_entered(body : Node2D):
	$AnimationPlayer.play("idle")

func _on_animation_player_animation_finished(anim_name):
	if anim_name == "idle":
		fall = true

func _on_timer_timeout():
	fall = false
	fall1 = false
	position.y = 0
	velocity.y = 0

@warning_ignore("unused_parameter")
func _on_area_2d_body_exited(body):
	$Timer.start()
	fall1 = true
	fall = false
