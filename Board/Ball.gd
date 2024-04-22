extends CharacterBody2D

const SPEED = 400

var player_paddle
var opponent_paddle

func _ready():
	player_paddle = get_parent().get_node("PlayerPaddle")
	opponent_paddle = get_parent().get_node("OpponentPaddle")
	
	randomize()
	var movement: Vector2 = Vector2.ZERO
	movement.x = [-1, 1][randi() % 2]
	movement.y = [-.7, .7][randi() % 2]
	
	velocity = movement * SPEED
	
func _physics_process(delta):
	var collision_object = move_and_collide(velocity * delta)
	
	if collision_object:
		velocity = velocity.bounce(collision_object.get_normal())
	
	if position.x < player_paddle.position.x:
		pass
