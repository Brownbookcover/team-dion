extends Node


@onready var global_vars = get_node("/root/Globals")

@export var IntroWaitTime:int = 5

# Called when the node enters the scene tree for the first time.
func _ready():
	$MainMenu.visible = true
	$PauseMenu.visible = false
	$main.visible = false
	

func enterIntro():
	global_vars.switchLock = true
	global_vars.can_switch = false
	print_debug("entered intro")


var introTimer: float = 0
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if global_vars.switchLock and introTimer > IntroWaitTime:
		exitIntro()
	elif global_vars.switchLock:
		introTimer+=delta
	
	if global_vars.ended_dogman_quest == true:
		outro()
		
func exitIntro():
	global_vars.switchLock = false
	global_vars.can_switch = true
	global_vars.dark_world = true
	print_debug("exited intro")

func outro():
	global_vars.dark_world = true
	global_vars.switchLock = true
	global_vars.can_switch = false
	$Fade_Out.transition()

func _on_main_menu_game_start():
	$MainMenu.visible = false
	$PauseMenu.visible = false
	$main.visible = true
	enterIntro()
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
