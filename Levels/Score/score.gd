extends Node2D


func _ready():
	$Score.text = "%10d" % GameValue.highestScore
	$"Last score".text = "%10d" % GameValue.score


func backMenu():
	TransBlack.change_scene_string("res://Levels/MainMenu/main_menu.tscn")
