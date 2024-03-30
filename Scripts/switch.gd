extends Node3D

@export var is_dark: bool = false

@onready var global_vars = get_node("/root/Globals")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func get_all_children(node) -> Array:
	var children = node.get_children()
	for child in children:
		children.append_array(get_all_children(child))
	return children

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var nodes = get_tree().get_nodes_in_group("DNE")
	#print(nodes)
	if global_vars.can_switch == true:
		var children = get_all_children(self)
		if global_vars.dark_world:
			if is_dark:
				visible = true
				for c in children:
					if "disabled" in c and c not in nodes:
						c.disabled = false
					if "freeze" in c:
						c.freeze = false
			else:
				visible = false
				for c in children:
					if "disabled" in c and c not in nodes:
						c.disabled = true
					if "freeze" in c:
						c.freeze = true
		else:
			if is_dark:
				visible = false
				for c in children:
					if "disabled" in c and c not in nodes:
						c.disabled = true
					if "freeze" in c:
						c.freeze = true
			else:
				visible = true
				for c in children:
					if "disabled" in c and c not in nodes:
						c.disabled = false
					if "freeze" in c:
						c.freeze = false
