extends Label

var one_time: bool = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	if Globals.has_tuna == true and one_time == true:
		visible = true
		one_time = false
		$Timer.start()


func _on_timer_timeout():
	visible = false
