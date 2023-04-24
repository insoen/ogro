extends Node2D
var bg_velocity = 8
var activo = false
@onready
var main = get_node("/root/Master")



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if activo:
		position.x = position.x - bg_velocity

#func _on_area_entered(area):
#	if area.name == 'area_inicio':
#		self.position = Vector2(267,-1123)
#		activo = false
#	elif area.name == "Fart2D":
#		main.score +=2
#		$explosion_enemy.emitting = true
#		$AnimatedSprite2D.play("die")


