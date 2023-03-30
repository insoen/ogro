extends Sprite2D
@export var bg_velocity = 2

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x = position.x - bg_velocity


func _on_area_fin_area_entered(area):
	self.position.x = self.position.x + 950 * 2
