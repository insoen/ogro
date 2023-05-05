extends Node2D
var bg_velocity = 8
var activo = false
@onready
var main = get_node("/root/Master")



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if !main.in_game:
		bg_velocity = 0
	if activo:
		position.x = position.x - bg_velocity

func _on_area_entered(area):
	if area.name == 'area_inicio':
		position = Vector2(267,-1123)
		activo = false


