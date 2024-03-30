extends StaticBody3D

@export var is_dark: bool = false

@onready var global_vars = get_node("/root/Globals")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if global_vars.dark_world:
		if is_dark:
			visible = true
			$CollisionShape3D.disabled = false
		else:
			visible = false
			$CollisionShape3D.disabled = true
	else:
		if is_dark:
			visible = false
			$CollisionShape3D.disabled = true
		else:
			visible = true
			$CollisionShape3D.disabled = false
