extends RigidBody3D

@export var Manager:Node
@export var Ball:RigidBody3D

var DogSpeed: float = 3
var isFetching: bool = false
# Called when the node enters the scene tree for the first time.
func _ready():
	Manager.FetchingStarted.connect(FetchingStarted_Handler)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if isFetching and Distance(position, Ball.position).z > 1:
		apply_force(Vector3(0,0,delta * DogSpeed * -1000))
		print_debug(delta * DogSpeed * -1000)
		print_debug("adding force")
	
	elif not isFetching:
		linear_velocity = Vector3.ZERO
	


func FetchingStarted_Handler():
	print_debug("Fetching handler ran")
	isFetching = true;
	#you have to talk to the guy to learn how he used to throw the ball, and do it like him
	#1 short and high 1 medium and low and 1 long and high

func Distance(from:Vector3, to:Vector3):
	return abs(Vector3(from.x - to.x, from.y - to.y, from.z - to.z))
