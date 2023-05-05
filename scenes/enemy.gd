extends Area2D
var bg_velocity = 7
var activo = false
@onready
var main = get_node("/root/Master")

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play("default")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if activo and !is_in_group("fijo"):
		position.x = position.x - bg_velocity
	else:
		$AnimatedSprite2D.play("default")
			

func _on_area_entered(area):
	if !is_in_group("fijo"):
		if area.name == 'area_inicio':
			self.position = Vector2(267,-1123)
			activo = false
		elif area.name == "Fart2D":
			main.score += 10
			$explosion_enemy.emitting = true
			$AnimatedSprite2D.play("die")

func _on_animated_sprite_2d_animation_finished():
	if $AnimatedSprite2D.play == "die":
		$AnimatedSprite2D.stop()
		self.position = Vector2(267,-1123)
		$AnimatedSprite2D.play("default")	




func _on_cerca_body_entered(body):
	if body.name == "Ogro":
		$Gruñido.play()
