extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position.y += gravity * delta
	global_rotation += 0.5



func _on_visible_on_screen_enabler_2d_screen_exited():
	queue_free()
	
