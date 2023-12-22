extends CanvasLayer




func _on_start_pressed():
	get_tree().paused = false
	$Menu.visible = false
	$Button.visible = true



func _on_restart_pressed():
	get_tree().paused = false
	GameValue.score = 0
	get_tree().reload_current_scene()


func _on_exit_pressed():
	get_tree().paused = false
	TransBlack.change_scene_string("res://Levels/MainMenu/main_menu.tscn")


func _on_button_pressed():
	$Button.visible = false
	$Menu.visible = true
	get_tree().paused = true
	
