extends Node3D


@export var new_x: float = 0
@export var new_y: float = 0
@export var new_z: float = 0

var moved: bool = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	if Globals.ended_dogman_quest == true and moved == false:
		dog_man_moved()
		
func dog_man_moved():
	global_position.x = new_x
	global_position.y = new_y
	global_position.z = new_z
	$"../CollisionShape3D".queue_free()
	moved = true
