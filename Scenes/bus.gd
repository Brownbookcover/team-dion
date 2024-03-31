extends AudioStreamPlayer3D


@export var intro_x: float = -13.0
@export var outro_x: float = 1000.0

var speed = 10

var intro = true
var outro = false

var time = 0.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time += delta 
	if intro:
		global_position.x += delta * speed
		if global_position.x > intro_x:
			intro = false
			play()
			%TalkLabel.show()
	
	if Globals.talked_to_bus:
		%TalkLabel.hide()
		stop()
	
	if Globals.ended_dogman_quest:
		play()
	
	if Globals.queue_outro:
		global_position.x += delta * speed
	
