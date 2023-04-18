extends CharacterBody2D
@onready
var main = get_node("/root/Master")
const JUMP_VELOCITY = -400.0
const FART = preload("res://scenes/fart.tscn")
var die = false
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	# Add the gravity.S
	if not is_on_floor():
		velocity.y += gravity * delta
	# Handle Jump.
	if main.in_game:
		#salta si está en el suelo. No genera partículas
		if Input.is_action_just_pressed("ui_accept") and is_on_floor(): 
			velocity.y = JUMP_VELOCITY
		# Desciende más rápido	
		elif Input.is_action_just_pressed("bajar") and !is_on_floor():
			velocity.y = -JUMP_VELOCITY	* 2
		#salta si NO está en el suelo. Genera partículas	
		elif Input.is_action_just_pressed("ui_accept") and !is_on_floor():
			velocity.y = JUMP_VELOCITY
			var fart_ins = FART.instantiate();
			fart_ins.position.x = $Marker2D.position.x
			fart_ins.position.y = $Marker2D.position.y
			add_child(fart_ins)
			fart_ins.get_node("fart").emitting = true
		
		#Si está en el suelo animación de andar
		if is_on_floor():
			$AnimatedSprite2D.play("run")
		#Si no está en el suelo animación de saltar	
		else:
			$AnimatedSprite2D.play("up")
	else:
		#Si se muere cae y animación de morir
		if velocity.y == 0 and !die:
			$AnimatedSprite2D.play("die")
			die = true
	move_and_slide()
			
func _on_area_2d_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	if area.is_in_group("enemies"):
		main.in_game = false

