extends Node2D
@onready
var main = get_node("/root/Master")
signal button_pressed
signal restart_pressed
signal bajonazo


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print(main.key)
	if main.in_game:
		$ScoreText.text = "Score: "+str(main.score)
		$KeyText.text = str(main.key)
	else:
		$FinalScoreText.text = "Final score: "+str(main.score)
		$ScoreText.text = "Score: "+str(main.score)	





func _on_play_button_pressed():
	emit_signal("button_pressed")


func _on_down_pressed():
	emit_signal("bajonazo")


func _on_restart_button_pressed():
	emit_signal("restart_pressed")


func _on_salir_released():
	get_tree().quit()
