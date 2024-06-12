extends Control

@export var toplamYasam :float
var kalanYasam : float
var olcek : float
@export var kirmiziCizgi : Node2D
@export var damageasble : Damageable
@export var game_over : CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready():
	damageasble.connect("onHit", onDamageableHit)
	toplamYasam = damageasble.health
	kalanYasam = toplamYasam

@warning_ignore("unused_parameter")
func onDamageableHit (node : Node, damageAmount : int, knockBack_direction : Vector2):
	kalanYasam -= damageAmount
	if (kalanYasam < 0):
		kalanYasam = 0
	olcek = kalanYasam / toplamYasam
	var olcekVectoru = kirmiziCizgi.transform.get_scale()
	olcekVectoru.x = olcek
	kirmiziCizgi.scale = olcekVectoru

# Called every frame. 'delta' is the elapsed time since the previous frame.
@warning_ignore("unused_parameter")
func _process(delta):
	if kalanYasam == 0:
		game_over.visible = true
	pass
