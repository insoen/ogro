extends Node2D
@onready
var main = get_node("/root/Master")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_area_entered(area):
	if area.name == 'AreaOgro' and main.in_game:
		visible = false
		main.key += 1
	elif area.name == 'area_inicio':
		visible = true	
