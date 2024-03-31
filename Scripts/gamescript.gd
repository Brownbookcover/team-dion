extends Node3D

@onready var global_vars = get_node("/root/Globals")

@onready var alec = $Dark/CharacterBody3D

# Called when the node enters the scene tree for the first time.
func _ready():
	$NavigationRegion3D.bake_navigation_mesh()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Globals.alec_died == true:
		print("Alec Died")		
		Globals.alec_died = false
		alec.queue_free()
	
	if Input.is_action_just_pressed("switch"):
		if global_vars.can_switch == true:
			global_vars.dark_world = not global_vars.dark_world


func _on_dog_ball_found():
	var arr = get_tree().get_nodes_in_group("ball")
	for a in arr:
		a.queue_free()


func _on_dog_player_met():
	Globals.ball_thrown = false
	Globals.catches += 1
