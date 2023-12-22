extends CharacterBody2D

@onready var animation : AnimationPlayer = $AnimationPlayer
@onready var timer1 : Timer = $Timer

var playerIn : bool = false
var death : bool = false
const bultPath = preload("res://Character/Enine/Totems/totems_bult.tscn")

func  fire():
	timer1.start()
	var bult : CharacterBody2D = bultPath.instantiate()
	bult.position = $Marker2D.position
	bult.dire = Vector2(-1 * scale.x, 0)
	add_child(bult)

@warning_ignore("unused_parameter")
func _process(delta):
	if !death and playerIn and timer1.is_stopped():
		animation.play("attack")

func _on_animation_tree_animation_finished(anim_name):
	if( anim_name == 'attack'):
		fire()

@warning_ignore("unused_parameter")
func _on_area_2d_body_entered(body):
	playerIn = true


@warning_ignore("unused_parameter")
func _on_area_2d_body_exited(body):
	playerIn = false
