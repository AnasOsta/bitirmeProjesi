extends Control

@export var toplamYasam :float
var kalanYasam : float
var olcek : float
@export var kirmiziCizgi : Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	kalanYasam = toplamYasam

func YasamAzalt (azaltmaMiktari : float = 1):
	kalanYasam -= azaltmaMiktari
	if (kalanYasam < 0):
		kalanYasam = 0
	olcek = kalanYasam / toplamYasam
	var olcekVectoru = kirmiziCizgi.transform.get_scale()
	olcekVectoru.x = olcek
	kirmiziCizgi.scale = olcekVectoru

# Called every frame. 'delta' is the elapsed time since the previous frame.
@warning_ignore("unused_parameter")
func _process(delta):
	pass
