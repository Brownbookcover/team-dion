extends StaticBody3D


# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var camera = get_node("../Neck/Camera3D")
	reparent(camera)
	
	if Globals.start_tossing == true:
		visible = true
	
	if Globals.ball_thrown ==  true:
		visible = false

