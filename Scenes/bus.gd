extends AudioStreamPlayer3D


@export var intro_x = -13
@export var outro_x = 1000

var speed = 10

var intro = true
var outro = false

var time = 0.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time += delta
	
	if intro and :
		global_position.x += delta * speed
		if global_position.x > intro_x:
			intro = false
			play()
	
	if Globals.talked_to_bus:
		stop()
	
	if outro:
		play()
		global_position.x += delta * speed
		if global_position.x > outro_x:
			outro = false
	
