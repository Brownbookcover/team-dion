extends Node3D

@onready var global_vars = get_node("/root/Globals")

@onready var alec = $Dark/CharacterBody3D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Globals.alec_died == true:
		print("Alec Died")		
		Globals.alec_died = false
		alec.queue_free()
	
	if Input.is_action_just_pressed("switch"):
		if global_vars.can_switch == true:
			global_vars.dark_world = not global_vars.dark_world
