extends CharacterBody2D


const SPEED = 450

func _physics_process(_delta):
	var movement: Vector2 = Vector2.ZERO
	if Input.is_action_pressed("W_KEY"): movement.y -= SPEED
	elif Input.is_action_pressed("S_KEY"): movement.y += SPEED
	
	velocity = movement
	move_and_slide()
