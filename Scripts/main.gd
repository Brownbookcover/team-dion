extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	$MainMenu.visible = true
	$PauseMenu.visible = false
	$main.visible = false



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_main_menu_game_start():
	$MainMenu.visible = false
	$PauseMenu.visible = false
	$main.visible = true

	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _on_player_pause():
	$MainMenu.visible = false
	$PauseMenu.visible = true
	$main.visible = false

	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _on_player_unpause():
	$MainMenu.visible = false
	$PauseMenu.visible = false
	$main.visible = true

	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
