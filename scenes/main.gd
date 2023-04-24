extends Node2D

@onready
var main = get_node("/root/Master")
var rng = RandomNumberGenerator.new()
# Called when the node enters the scene tree for the first time.
func _ready():
	$GUI/RestartButton.visible = false
	$GUI/FinalScoreText.visible = false
	$GUI.connect("button_pressed", play_button_pressed)
	$GUI.connect("restart_pressed", restart_button_pressed)

func _process(delta):
	if !main.in_game:
		$GUI/RestartButton.visible = true
		$GUI/Salir.visible = true
		$GUI/FinalScoreText.visible = true
		
func init_timer():
	var my_random_number = rng.randf_range(1.0, 3.0)
	$Timer.connect("timeout",call_enemy)
	$Timer.one_shot = true
	$Timer.set_wait_time(my_random_number)
	$Timer.start()
	
func call_enemy():
	var array = [$Enemy, $Enemy2, $Enemy3, $Enemy4]
	var my_random_number = rng.randi_range(0,array.size() - 1)
	
	if array[my_random_number].activo == false:
		array[my_random_number].position = Vector2(1584,106)
		array[my_random_number].activo = true	           
	init_timer()
	


func _on_area_inicio_area_entered(area):
	if(area.name == 'fin_suelo'):
		area.get_parent().get_parent().position.x = 1700


func play_button_pressed():
	main.score = 0
	init_timer()
	$StartSound.playing = true
	$GUI/PlayButton.visible = false
	call_obstacle()
	$GUI/Salir.visible = false
	
func restart_button_pressed():
	$StartSound.playing = true
	$GUI/RestartButton.visible = false
	$GUI/FinalScoreText.visible = false
	main.in_game = true	
	get_tree().reload_current_scene()
	
func call_obstacle():
	var array = [$Obstaculo, $Obstaculo2]
	var my_random_number = rng.randi_range(0,array.size() - 1)
	
	if array[my_random_number].activo == false:
		array[my_random_number].position = Vector2(1520,0)
		array[my_random_number].activo = true           
	


func _on_background_sound_finished():
	$BackgroundSound.play()
