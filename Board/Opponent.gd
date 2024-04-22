extends CharacterBody2D

const POSITIONAL_OFFSET: int = 50
const SPEED: int = 350
var ball

func _ready():
	ball = get_parent().get_node("Ball")

func _process(_delta):
	var screen_width = get_viewport_rect().size.x
	var collision_shape = $CollisionShape2D
	var rectangle_shape = collision_shape.shape as RectangleShape2D
	var width = rectangle_shape.extents.x * 2
	
	position.x = screen_width - width - POSITIONAL_OFFSET
	
func _physics_process(delta):
	get_opponent_direction()
	move_and_slide()

func get_opponent_direction():
	var movement: Vector2 = Vector2.ZERO
	
	if (ball.position.y - position.y) > 25:
		movement.y = 1 * SPEED
		
	else:
		movement.y = -1 * SPEED
	
	velocity = movement
