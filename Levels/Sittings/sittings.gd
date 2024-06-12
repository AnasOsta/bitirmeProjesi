extends Node2D

@onready var trueMusic : Sprite2D = $MarginContainer/VBoxContainer/MarginContainer/Panel/Panel/Music/Sprite2D
@onready var falseMusic : Sprite2D = $MarginContainer/VBoxContainer/MarginContainer/Panel/Panel/Music/Sprite2D2
@onready var trueSFX : Sprite2D = $MarginContainer/VBoxContainer/MarginContainer/Panel/Panel/SFX/Sprite2D
@onready var falseSFX : Sprite2D = $MarginContainer/VBoxContainer/MarginContainer/Panel/Panel/SFX/Sprite2D2
@onready var volume : HSlider = $MarginContainer/VBoxContainer/MarginContainer/Panel/HSlider
func _ready():
	trueMusic.visible = GameValue.music
	falseMusic.visible = !GameValue.music
	trueSFX.visible = GameValue.sfx
	falseSFX.visible = !GameValue.sfx
	volume.value = GameValue.volume

func _on_prev_pressed():
	TransBlack.change_scene_string("res://Levels/MainMenu/main_menu.tscn")


func _on_music_pressed():
	trueMusic.visible = !trueMusic.visible 
	falseMusic.visible = !falseMusic.visible
	GameValue.music = !GameValue.music
	if GameValue.music:
		$"/root/SceneMusic".play()
	else :
		$"/root/SceneMusic".stop()


func _on_sfx_pressed():
	trueSFX.visible = !trueSFX.visible
	falseSFX.visible = !falseSFX.visible
	GameValue.sfx = !GameValue.sfx 

func _on_h_slider_value_changed(value : float):
	GameValue.volume = value
