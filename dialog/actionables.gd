extends Area3D

@export var dialog_resource: DialogueResource

@export var dialog_start: String = "start"

@onready var global_vars = get_node("/root/Globals")

func action() -> void:
	DialogueManager.show_example_dialogue_balloon(dialog_resource, dialog_start)
