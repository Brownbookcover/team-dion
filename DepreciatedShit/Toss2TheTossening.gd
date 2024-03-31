extends Node3D

func _ready():
	$NavigationRegion3D.bake_navigation_mesh()

func _on_dog_ball_found():
	var arr = get_tree().get_nodes_in_group("ball")
	for a in arr:
		a.queue_free()


func _on_dog_player_met():
	Globals.ball_thrown = false
	Globals.catches += 1
