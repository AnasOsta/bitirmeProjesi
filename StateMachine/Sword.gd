extends Area2D

@export var damage : int = 10
@export var player : Player
@export var facingCollisionShape2D : FacingColltionShape2D

func _ready():
	player.connect("facingDirectionChanged", onPlayerFacingDirectionChanged)



func onPlayerFacingDirectionChanged(facingRight : bool):
	if facingRight:
		$"../Marker2D".scale.x = -1
		facingCollisionShape2D.position = facingCollisionShape2D.facingLeftPotion
	else :
		$"../Marker2D".scale.x = 1
		facingCollisionShape2D.position = facingCollisionShape2D.facingRightPotion


func _on_body_entered(body : Node2D):
	if(body.is_in_group("Chest")):
		body.open()
	for child in body.get_children():
		if child is Damageable:
			
			var directionToDamageable = body.global_position - get_parent().global_position
			var directionSign = sign(directionToDamageable.x)
			
			if directionSign > 0:
				child.hit(damage, Vector2.RIGHT)
			elif directionSign < 0:
				child.hit(damage, Vector2.LEFT)
			else:
				child.hit(damage, Vector2.ZERO)


@warning_ignore("unused_parameter")
func _on_hit_box_buttom_body_entered(body : Node2D):
	for child in player.get_children():
		if child is Damageable:
			child.hit(damage, Vector2(0,-1))
