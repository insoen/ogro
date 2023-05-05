extends Node2D
@onready
var main = get_node("/root/Master")
var open_chest = preload('res://tiles/blocks/Chest_01_Unlocked.png')
var locked_chest = preload('res://tiles/blocks/Chest_01_Locked.png')
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_area_entered(area):
	if area.name == 'AreaOgro' and main.in_game:
		if main.key > 0:
			$Sprite2D.texture = open_chest
			main.key -= 1
			main.powerup = 3
	elif area.name == 'area_inicio':
		$Sprite2D.texture = locked_chest	
