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



	

