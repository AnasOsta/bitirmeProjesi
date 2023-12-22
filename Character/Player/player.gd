extends CharacterBody2D

class_name Player

@export var SPEED : float = 200.0

@onready var sprite : Sprite2D = $Sprite2D
@onready var animation_tree : AnimationTree = $AnimationTree
@onready var state_machine : CharacterStateMachine = $CharecterStateMachine

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var direction : Vector2 = Vector2.ZERO

signal facingDirectionChanged(facingRight : bool)

func _ready():
	animation_tree.active = true

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	
	direction = Input.get_vector("left", "right", "up", "down")
	if direction.x != 0 && state_machine.check_is_can_move():
		velocity.x = direction.x * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide()
	update_animation()
	update_facing_direction()

func update_animation():
	animation_tree.set("parameters/move/blend_position", direction.x)
	
func update_facing_direction():
	if direction.x > 0 :  sprite.flip_h = false
	elif direction.x < 0 : sprite.flip_h = true
	emit_signal("facingDirectionChanged", sprite.flip_h)
