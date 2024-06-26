extends Area3D

@onready var global_vars = get_node("/root/Globals")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_body_entered(body):
	if global_vars.switchLock:
		return
	if body.is_in_group("player"):
		#print("cant switch")
		global_vars.can_switch = false


func _on_body_exited(body):
	if global_vars.switchLock:
		return
	if body.is_in_group("player"):
		#print("can switch")
		global_vars.can_switch = true
