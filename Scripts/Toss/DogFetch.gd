extends RigidBody3D

@export var Manager:Node
@export var Ball:RigidBody3D
@export var DogReturnArea:Area3D

var DogSpeed: float = 9
var MaxSpeed: float = 5

var isFetching: bool = false
var isReturning: bool = false

var DogInitialSpot: Vector3
# Called when the node enters the scene tree for the first time.
func _ready():
	Manager.FetchingStarted.connect(FetchingStarted_Handler)
	DogInitialSpot = DogReturnArea.position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if isReturning:
		MoveDog(delta, DogInitialSpot)
	elif isFetching:
		MoveDog(delta, Ball.position)
	
	elif not isFetching:
		linear_velocity = Vector3.ZERO
	

func MoveDog(delta:float, toPosition: Vector3):
	var distance = Distance(toPosition, position)
	var direction = Vector3(distance.x, 0, distance.z).normalized()
	print_debug(direction)
	if linear_velocity.length() < -MaxSpeed:
		return
		
	apply_force(Vector3(direction.x, 0, direction.z)* delta * DogSpeed * 100)
	#apply_force(direction* delta * DogSpeed * 100)


func FetchingStarted_Handler():
	isFetching = true;
	#you have to talk to the guy to learn how he used to throw the ball, and do it like him
	#1 short and high 1 medium and low and 1 long and high

func Distance(from:Vector3, to:Vector3):
	return from - to
	#return abs(Vector3(from.x - to.x, from.y - to.y, from.z - to.z))


func DogReturnBall():
	Manager.ReturnBall()
	


func _on_area_3d_body_entered(body):
	print_debug(body.name)
	if body.name == "DogBody3D":
		isFetching = false
		isReturning = true
		DogReturnBall()


func _on_dog_return_area_3d_body_entered(body):
	if body.name == "DogBody3D":
		isFetching = false
		isReturning = false
