extends Node2D
var bg_velocity = 8
var activo = false
@onready
var main = get_node("/root/Master")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if activo and main.in_game:
		position.x = position.x - bg_velocity


func _on_area_fin_area_entered(area):
	if area.name == 'area_inicio':
		position = Vector2(267,-1123)
		activo = false
