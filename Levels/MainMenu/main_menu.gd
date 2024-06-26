extends Node2D
const stream = preload("res://ost/undertale-ost-012-home-made-with-Voicemod.mp3")
func _ready():
	if GameValue.score > GameValue.highestScore:
		GameValue.highestScore = GameValue.score
	SceneMusic.play_music(stream)

func _on_sittings_pressed():
	TransBlack.change_scene_string("res://Levels/Sittings/sittings.tscn")


func _on_levels_pressed():
	TransBlack.change_scene_string("res://Levels/LevelsUI/levels.tscn")


func _on_play_pressed():
	preload("res://Levels/level_1.tscn")
	LoadingManager.load_scene("res://Levels/level_1.tscn")


func _on_score_pressed():
	TransBlack.change_scene_string("res://Levels/Score/score.tscn")


func _on_info_pressed():
	TransBlack.change_scene_string("res://Levels/Info/info.tscn")


func _on_exit_pressed():
	get_tree().quit()


func _on_store_pressed():
	TransBlack.change_scene_string("res://Levels/Store/store.tscn")


func _on_cridet_pressed():
	TransBlack.change_scene_string("res://Levels/Cridet/cridet.tscn")
