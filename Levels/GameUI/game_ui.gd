extends CanvasLayer



func _ready():
	$Score/Score.text = "0"
	

func _process(delta):
	$Score/Score.text =  "%10d" % GameValue.score
