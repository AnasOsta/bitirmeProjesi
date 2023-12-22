extends CanvasLayer

func change_scene_string(taeget: String)->void:
	$AnimationPlayer.play("des")
	await $AnimationPlayer.animation_finished
	get_tree().change_scene_to_file(taeget)
	$AnimationPlayer.play_backwards("des")

func change_scene_packed_scene(taeget: PackedScene)->void:
	$AnimationPlayer.play("des")
	await $AnimationPlayer.animation_finished
	get_tree().change_scene_to_packed(taeget)
	$AnimationPlayer.play_backwards("des")
