extends AudioStreamPlayer

func _play_music(music : AudioStream):
	if(!GameValue.music):
		stop()
		return
	if stream == music:
		return
	stream = music
	play()
@warning_ignore("unused_parameter")
func _process(delta):
	volume_db = GameValue.volume

func play_music(musicStream : AudioStream):
	_play_music(musicStream)
