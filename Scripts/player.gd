extends CharacterBody3D

signal pause
signal unpause
signal ball_thrown
var is_paused: bool = false

const SPEED = 2
const JUMP_VELOCITY = 4.5
var input_vector: Vector3 = Vector3.ZERO

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

@onready var Light_World_Env = preload("res://lighting_test/light_world_world_env.tres")
@onready var Dark_World_Env = preload("res://lighting_test/dark_world_world_env.tres")
var ball = load("res://Scenes/MovingBall.tscn")

@onready var global_vars = get_node("/root/Globals")

@onready var neck:=$Neck
@onready var camera:=$Neck/Camera3D

@onready var actionable_finder: RayCast3D = $Neck/Camera3D/RayCast3D


func _unhandled_input(event):
	if Input.is_action_just_pressed("ui_accept"):
		var actionable = actionable_finder.get_collider()
		#print(actionable)
		if actionable != null or actionable != RayCast3D:
			input_vector = Vector3.ZERO
			actionable.action()
			return
			
	if Input.is_action_just_pressed("Throw"):
		if Globals.catches <= 2:
			if Globals.start_tossing == true and Globals.ball_thrown == false:
				Globals.ball_thrown = true
				var instance = ball.instantiate()
				instance.position = actionable_finder.global_position
				instance.transform.basis = actionable_finder.global_transform.basis
				get_parent().add_child(instance)
				ball_thrown.emit()
		
	if event is InputEventMouseButton:
		#unpause.emit()
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	elif event.is_action_pressed("ui_cancel"):
		#pause.emit()
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		if event is InputEventMouseMotion:
			neck.rotate_y(-event.relative.x * 0.003)
			camera.rotate_x(-event.relative.y * 0.003)
			camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-30), deg_to_rad(60))
	
	var input_dir = Input.get_vector("Left", "Right", "Forward", "Back")
	var direction = (neck.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		input_vector.x = direction.x * SPEED
		input_vector.z = direction.z * SPEED
	else:
		input_vector.x = 0
		input_vector.z = 0
		
func _physics_process(delta):
	
	if input_vector.length() > 0:
		velocity = input_vector * SPEED
	else:
		velocity = velocity.move_toward(Vector3.ZERO, SPEED)
		
	if not is_on_floor():
		velocity.y -= gravity * delta * 50
		
	# Uncomment out later, Alec's env stuff
	if global_vars.dark_world == true:
		camera.environment = Dark_World_Env
	else:
		camera.environment = Light_World_Env

	move_and_slide()
