extends CharacterBody3D

signal ball_found
signal player_met

const SPEED = 5
const JUMP_VELOCITY = 4.5

var follow_ball = false
var follow_player = false
var ball
var player
var ball_pos
var dog_pos
var player_pos

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _ready():
	player = get_tree().get_nodes_in_group("player")[0]

func _physics_process(delta):
	if Globals.bad_ball == true:
		follow_ball = false
	if Globals.dog_has_new_owner == true:
		player = get_tree().get_nodes_in_group("dogboy")[0]
	if follow_ball == true:
		ball_pos = ball.global_transform.origin
		dog_pos = global_transform.origin
		var distance = ball_pos.distance_to(dog_pos)
		if distance < 0.6:
			follow_ball = false
			follow_player = true
			ball_found.emit()
			return
		$NavigationAgent3D.set_target_position(ball.global_transform.origin)
		var next_point = $NavigationAgent3D.get_next_path_position()
		velocity = (next_point - global_transform.origin).normalized() * SPEED
		look_at(Vector3(ball.global_position.x, global_position.y, ball.global_position.z), Vector3.UP)
		move_and_slide()
	if follow_player == true:
		player_pos = player.global_transform.origin
		dog_pos = global_transform.origin
		var distance = player_pos.distance_to(dog_pos)
		if distance < 1:
			player_met.emit()
			if Globals.catches < 3:
				follow_player = false
			return
		$NavigationAgent3D.set_target_position(player.global_transform.origin)
		var next_point = $NavigationAgent3D.get_next_path_position()
		velocity = (next_point - global_transform.origin).normalized() * SPEED
		look_at(Vector3(player.global_position.x, global_position.y, player.global_position.z), Vector3.UP)
		move_and_slide()


func _on_player_ball_thrown():
	await get_tree().create_timer(0.2).timeout
	ball = get_tree().get_nodes_in_group("ball")[0]
	follow_ball = true
