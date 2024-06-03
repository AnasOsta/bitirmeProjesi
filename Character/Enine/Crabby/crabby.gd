extends CharacterBody2D

@export var speed = 50
var speed1 : int
@export var attackAnimationString : String
@export var returnAnimationString : String
@export var damage : int = 10
@export var animation_tree : AnimationTree
@onready var right : Vector2
@onready var left : Vector2
@onready var state_machine : CharacterStateMachine = $CharacterStateMachine
# Get the gravity from the project settings to be synced with RigidBody nodes.
var playback : AnimationNodeStateMachinePlayback
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var direction = -1

func _ready():
	playback = animation_tree["parameters/playback"]
	animation_tree.active = true
	right = $Right.global_position
	left = $Left.global_position
	speed1 = speed

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if is_on_wall() || (right.x - global_position.x <= 0) || (left.x - global_position.x >= 0):
		$Marker2D.scale.x = direction
		direction *= -1
	if state_machine.check_is_can_move():
		velocity.x = direction * speed

	move_and_slide()

@warning_ignore("unused_parameter")
func _on_attack_area_body_entered(body):
	speed = 0
	$Timer.start()

func _on_timer_timeout():
	if state_machine.current_state.can_attack: 
		playback.travel(attackAnimationString)

func _on_attack_body_entered(body):
	for child in body.get_children():
		if child is Damageable && state_machine.current_state.can_attack :
			
			var directionToDamageable = body.global_position - get_parent().global_position
			var directionSign = sign(directionToDamageable.x)
			
			if directionSign > 0:
				child.hit(damage, Vector2.RIGHT)
			elif directionSign < 0:
				child.hit(damage, Vector2.LEFT)
			else:
				child.hit(damage, Vector2.ZERO)

func _on_animation_tree_animation_finished(anim_name):
	if anim_name == "Attack":
		speed = speed1
		pass
