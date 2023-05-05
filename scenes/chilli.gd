extends Node2D
var lado = true
@onready
var main = get_node("/root/Master")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	if rotation_degrees == -10:
		rotation_degrees = 0
	elif rotation_degrees == 10:
		rotation_degrees = 0
	else:
		if lado:
			rotation_degrees = -10	
		else:
			rotation_degrees = 10	


func _on_area_2d_area_entered(area):
	if area.name == 'AreaOgro' and main.in_game:
		visible = false
	elif area.name == 'area_inicio':
		visible = true	
