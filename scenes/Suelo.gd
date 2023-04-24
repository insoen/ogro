extends Node2D
var bg_velocity = 4
@onready
var main = get_node("/root/Master")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if main.in_game:
		position.x = position.x - bg_velocity

func _on_right_arrow_area_2d_area_entered(area):
	if area.name == "area_inicio":
		$Right_arrow_area2D.queue_free()
