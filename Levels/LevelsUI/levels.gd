extends Node2D




func level_1():
	LoadingManager.load_scene("res://Levels/level_1.tscn")


func level_2():
	@warning_ignore("unused_variable")
	var level2 = preload("res://Levels/level_2.tscn")
	LoadingManager.load_scene("res://Levels/level_2.tscn")


func level_3():
	pass # Replace with function body.


func level_4():
	pass # Replace with function body.


func level_5():
	pass # Replace with function body.


func level_6():
	pass # Replace with function body.


func level_boss():
	pass # Replace with function body.


func _on_back_pressed():
	TransBlack.change_scene_string("res://Levels/MainMenu/main_menu.tscn")
