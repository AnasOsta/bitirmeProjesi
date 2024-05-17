extends CanvasLayer


func _ready():
	$Score/Score.text = "0"
	if GameValue.score > GameValue.highestScore:
		GameValue.highestScore = GameValue.score
	GameValue.score = 0

func _process(delta):
	$Score/Score.text =  "%10d" % GameValue.score
