extends Node2D

@onready
var main = get_node("/root/Master")
var rng = RandomNumberGenerator.new()
# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.connect("timeout",call_enemy)
	$Timer2.connect("timeout",call_chillies)
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
	$Timer.one_shot = true
	$Timer.set_wait_time(my_random_number)
	$Timer.start()
	
func init_timer2():
	var my_random_number = rng.randf_range(0.5, 1.5)
	$Timer2.one_shot = true
	$Timer2.set_wait_time(my_random_number)
	$Timer2.start()	
	
func _on_area_inicio_area_entered(area):
	if(area.name == 'fin_suelo'):
		area.get_parent().get_parent().position.x = 1700
	elif (area.name == 'fin_obstaculo'):
		call_obstacle()
		area.get_parent().position = Vector2(75,-1319)
		area.get_parent().activo = false

func play_button_pressed():
	main.score = 0
	init_timer()
	init_timer2()
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
	if main.in_game:
		var array = [$Obstaculo,$Obstaculo2, $Obstaculo3, $Obstaculo4, $Obstaculo5, $Obstaculo6]
		var my_random_number = rng.randi_range(0,array.size() - 1)

		if array[my_random_number].activo == false:
			array[my_random_number].position = Vector2(1520,0)
			array[my_random_number].activo = true           
		else:
			call_obstacle()

func call_enemy():
	var array = [$Enemy, $Enemy2, $Enemy3, $Enemy4]
	var my_random_number = rng.randi_range(0,array.size() - 1)
	
	if array[my_random_number].activo == false:
		array[my_random_number].position = Vector2(1584,106)
		array[my_random_number].activo = true	  
	init_timer()
				
func call_chillies():
	if main.in_game:
			var array = [$Chilli3,$Chilli5,$Chilliex10]
			var random_pos = rng.randi_range(0,3)
			var my_random_number = rng.randi_range(0,array.size() - 1)
			if array[my_random_number].activo == false:
				if random_pos == 0:
					array[my_random_number].position = Vector2(1340,211)
				elif random_pos == 1:
					array[my_random_number].position = Vector2(1340,454)
				elif random_pos == 2:
					array[my_random_number].position = Vector2(1340,60)	
				else:
					array[my_random_number].position = Vector2(1340,643)
				array[my_random_number].activo = true        
			init_timer2()		
		
func _on_background_sound_finished():
	$BackgroundSound.play()
