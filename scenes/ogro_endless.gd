extends CharacterBody2D

const JUMP_VELOCITY = -400.0


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
#Si ha recolectado algùn chilli puede hacer doble salto



func _physics_process(delta):
	# Add the gravity.S
	if not is_on_floor():
		velocity.y += gravity * delta
	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor(): 
		velocity.y = JUMP_VELOCITY
	elif Input.is_action_just_pressed("ui_accept") and !is_on_floor() :
		$fart.emitting = true
		velocity.y = JUMP_VELOCITY
	var collision = move_and_slide()

#	if $RayCast2D.is_colliding() and $fart.emitting:
#		var collision = $RayCast2D.get_collider()
	if is_on_floor():
		$AnimatedSprite2D.play("run")
	else:
		$AnimatedSprite2D.play("up")
				


