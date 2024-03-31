extends Control

@onready var color_rect = $ColorRect
@onready var animation = $AnimationPlayer

func _ready():
	color_rect.visible = false
	
func transition():
	color_rect.visible = true
	animation.play("fade_to_black")
