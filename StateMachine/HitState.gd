extends State

class_name HitState

@export var damageasble : Damageable
@export var deadState : State
@export var returnState : State

@export var deadAnimatoinNode : String = "Dead"
@export var hitAnimationString : String = 'hit'

@export var knockBack_speed : float = 100.0

@onready var timer : Timer = $Timer

func _ready():
	damageasble.connect("onHit", onDamageableHit)
	
func on_enter():
	timer.start()

@warning_ignore("unused_parameter")
func onDamageableHit(node : Node, damageAmount : int, knockBack_direction : Vector2):
	if damageasble.health > 0:
		character.velocity = knockBack_speed * knockBack_direction
		emit_signal("interruptState", self)
		playback.travel(hitAnimationString)
	else:
		emit_signal("interruptState", deadState)
		playback.travel(deadAnimatoinNode)

func on_exit():
	character.velocity = Vector2.ZERO


func _on_timer_timeout():
	next_state = returnState
