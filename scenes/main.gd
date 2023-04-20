extends Node2D

@onready
var main = get_node("/root/Master")
var rng = RandomNumberGenerator.new()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


		
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


func _on_play_button_pressed():
	init_timer()
	$StartSound.playing = true
	$PlayButton.visible = false

