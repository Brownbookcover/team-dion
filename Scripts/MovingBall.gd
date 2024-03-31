extends RigidBody3D

var throw_speed = 15
var time = 0
var g = -20
var hit_ground = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$RayCast3D.enabled = false
	$Timer.start()
	$Timeout.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var actionable = $RayCast3D.get_collider()
	if actionable != null:
		hit_ground = true
		
	if not hit_ground:
		time += delta
		var Change = Vector3()
		Change = Vector3(0, 10 * time * g * time**2, -1000 * delta)
		position += transform.basis * Change * delta

func _on_timer_timeout():
	$RayCast3D.enabled = true


func _on_timeout_timeout():
	Globals.start_tossing = true
	Globals.ball_thrown = false
	Globals.bad_ball = true
	queue_free()
