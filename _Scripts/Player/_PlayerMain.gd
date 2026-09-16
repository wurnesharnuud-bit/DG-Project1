extends CharacterBody2D
class_name Player

@export_group("Stats")
@export var speed: float = 8000
@export var jump_height: float = -550
@export var use_alt_inputs: bool = false
var can_move: bool = true
var dash:float = 1.0
var CanDash:bool = true

func _physics_process(delta: float) -> void:
	# Moving
	if can_move:
		var direction = input_movement()
		velocity.x = (speed * direction) * delta * dash
		# Jumping
		check_jump()
	# Apply updated movement
	move_and_slide()
	
	if Input.is_action_just_pressed("dash"):
		Dash()
	
	if dash > 1.0:
		dash -= 0.1*delta
	
	# Out-of-bounds Fix
	if global_position.y > 1000: 
		get_tree().change_scene_to_file("res://_Levels/Level_0_Tutorial.tscn")

#region - Functions
# Checks direction 
# (-1 if left, 1 if right, 0 if neither/both)
func input_movement():
	var input_direction : float
	# Checks either WASD or Keycode inputs
	if use_alt_inputs: input_direction = Input.get_axis("move_left_2", "move_right_2")
	else: 			   input_direction = Input.get_axis("move_left_1", "move_right_1")
	# ----
	return input_direction

func Dash():
	if CanDash:
		dash = 2.0
		CanDash = false
		await get_tree().create_timer(0.5).timeout
		dash = 1.0
		CanDash = true

func check_jump():
	if use_alt_inputs:
		if Input.is_action_just_pressed("move_up_2"): jump()
	else:
		if Input.is_action_just_pressed("move_up_1"): jump()
# If on floor, jump
func jump():
	if is_on_floor(): velocity.y = jump_height
#endregion
