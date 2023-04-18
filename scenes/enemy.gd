extends Area2D
var bg_velocity = 8
var activo = false
@onready
var main = get_node("/root/Master")

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play("default")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if activo:
		position.x = position.x - bg_velocity
	else:
		$AnimatedSprite2D.play("default")	

func _on_area_entered(area):
	if area.name == 'area_inicio':
		self.position = Vector2(267,-1123)
		activo = false
	elif area.name == "Fart2D":
		main.score +=2
		$explosion_enemy.emitting = true
		$AnimatedSprite2D.play("die")

func _on_animated_sprite_2d_animation_finished():
	if $AnimatedSprite2D.play == "die":
		$AnimatedSprite2D.stop()
		self.position = Vector2(267,-1123)
		$AnimatedSprite2D.play("default")	
