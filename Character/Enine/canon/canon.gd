extends CharacterBody2D

var playback : AnimationNodeStateMachinePlayback
@onready var animation_tree : AnimationTree = $AnimationTree
@onready var timer : Timer =  $CharacterStateMachine/Dead/Timer
@onready var timer1 : Timer = $Timer

var playerIn : bool = false
var death : bool = false
const bultPath = preload("res://Character/Enine/canon/canon_ball.tscn")

func _ready():
	playback = animation_tree["parameters/playback"]

func  fire():
	timer1.start()
	var bult : CharacterBody2D = bultPath.instantiate()
	bult.position = $Marker2D.position
	add_child(bult)

@warning_ignore("unused_parameter")
func _process(delta):
	if !death and playerIn and timer1.is_stopped():
		playback.travel("attack")

func _on_timer_timeout():
	queue_free()

func _on_animation_tree_animation_finished(anim_name):
	if( anim_name == 'attack'):
		fire()
	if( anim_name == 'dead'):
		death = true
		timer.start()


@warning_ignore("unused_parameter")
func _on_area_2d_body_entered(body):
	playerIn = true


@warning_ignore("unused_parameter")
func _on_area_2d_body_exited(body):
	playerIn = false
