extends Node

class_name  Damageable

signal onHit(node : Node, damageToken : int, knockBack_direction : Vector2)

@export var deadAnimationName : String = "dead"
@export var health : float = 20 :
	get:
		return health
	set(data):
		SignaBus.emit_signal("onHealthChanged", get_parent(), data - health)
		health = data

func hit(damage : int, knockBack_direction : Vector2):
	health -= damage
	
	emit_signal("onHit", get_parent(), damage, knockBack_direction)


func _on_animation_tree_animation_finished(anim_name):
	if anim_name == deadAnimationName:
		get_parent().queue_free()
