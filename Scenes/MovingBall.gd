extends RigidBody3D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func get_throw(impulse: Vector3):
	apply_impulse(Vector3(0, 0, 0), impulse)
