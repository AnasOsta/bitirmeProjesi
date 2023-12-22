extends CharacterBody2D


var SPEED = 30
var direction = -1
var iSeePlayer = false
var isInArea = false
var run = false

@export var sceneStr : String = ""

@onready var dialog : AnimatedSprite2D = $Marker2D/dialog
@onready var sprite : AnimatedSprite2D = $Marker2D/AnimatedSprite2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if is_on_wall():
		$Marker2D.scale.x = direction
		direction *= -1
	velocity.x = direction * SPEED

	move_and_slide()


@warning_ignore("unused_parameter")
func _on_area_2d_body_entered(body):
	if isInArea && !run:
		iSeePlayer = true
		run = true
		dialog.play("in")
		SPEED = 190
	if run : 
		$Marker2D/Area2D2.set_deferred("monitoring" , true)

@warning_ignore("unused_parameter")
func _on_area_2d_body_exited(body):
	iSeePlayer = false

@warning_ignore("unused_parameter")
func _on_exite_area(body):
	SPEED = 30
	if run:
		dialog.play("out")
	isInArea = false
	run = false
	$Marker2D/Area2D2.set_deferred("monitoring" , false)


@warning_ignore("unused_parameter")
func _on_entred_area(body):
	isInArea = true


@warning_ignore("unused_parameter")
func _on_dead_player_body_entered(body):
	TransBlack.change_scene_string(sceneStr)


func _player_finded(body):
	$Marker2D.scale.x = direction
	direction *= -1
