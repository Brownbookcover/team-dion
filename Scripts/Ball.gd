extends StaticBody3D

var run_once_i_fucking_hate_this_code_this_cant_go_in_ready_so_needs_to_be_in_process_but_this_breaks_if_it_runs_two_times = false

# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if run_once_i_fucking_hate_this_code_this_cant_go_in_ready_so_needs_to_be_in_process_but_this_breaks_if_it_runs_two_times == false:
		var camera = get_node("../Neck/Camera3D")
		reparent(camera)
		run_once_i_fucking_hate_this_code_this_cant_go_in_ready_so_needs_to_be_in_process_but_this_breaks_if_it_runs_two_times = true
	if Globals.catches <= 2:
		if Globals.start_tossing == true:
			visible = true
		
		if Globals.ball_thrown ==  true:
			visible = false

