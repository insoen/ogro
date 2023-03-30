extends CharacterBody2D

const FART = preload("res://scenes/fart.tscn")

const SPEED = 300.0
const JUMP_VELOCITY = -700.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
#Si ha recolectado algùn chilli puede hacer doble salto
var chilli = 100
func _physics_process(delta):
	# Add the gravity.S
	if not is_on_floor():
		velocity.y += gravity * delta
	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor(): 
		velocity.y = JUMP_VELOCITY
	elif Input.is_action_just_pressed("ui_accept") and (!is_on_floor() and chilli > 0) :
		var fart_ins = FART.instantiate();
		fart_ins.position.x = $fart.position.x 
		fart_ins.position.y = $fart.position.y -10
		self.add_child(fart_ins)
		$fart.emitting = true
		velocity.y = JUMP_VELOCITY
		chilli -= 1	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	move_and_slide()

	if is_on_floor():
		if direction == 0:
			$AnimatedSprite2D.play("idle")
		else:
			$AnimatedSprite2D.play("run")	
			if direction == -1:
				$AnimatedSprite2D.flip_h = true
			else:
				$AnimatedSprite2D.flip_h = false
	else:
		$AnimatedSprite2D.play("up")	
				


