extends Node3D

@onready var label = $Label

@onready var global_vars = get_node("/root/Globals")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("switch"):
		if global_vars.dark_world:
			label.text = "Light"
		else:
			label.text = "Dark"
		global_vars.dark_world = not global_vars.dark_world
