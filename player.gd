extends CharacterBody2D


const SPEED = 200.0
const JUMP_VELOCITY = -300.0
@onready var playeranimated: AnimatedSprite2D = $Playeranimated


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("attack") and is_on_floor():
		$Playeranimated.play("attackground")
		
	if Input.is_action_just_pressed("attack") and not is_on_floor():
		$Playeranimated.play("attackair")

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	
	if direction > 0:
		playeranimated.flip_h = false
	elif direction < 0:
		playeranimated.flip_h = true
	
	if not direction == 0:
		playeranimated.play("running")

	if not Input.is_anything_pressed():
		playeranimated.play("default")
		

		

	
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
