extends Node

signal FetchingStarted

var time = 0


enum Phase{
	None,
	Waiting,
	Height,
	Distance,
	Throwing,
	Fetching
}
var Height = -1
var Distance = -1
var PowerMult = 5
var currentPhase = Phase.None
var PowerDirection = 1

@export var Ball:RigidBody3D
var BallStart: Vector3
# Called when the node enters the scene tree for the first time.
func _ready():
	BallStart = Ball.position
	ResetBall()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _unhandled_input(event):
	
	if Input.is_action_just_pressed("Back"):
		currentPhase = Phase.Waiting
		print_debug("Going to waiting phase")
		Height = 0
		Distance = 0
	
	
	if Input.is_action_just_pressed("Forward"):
		if currentPhase == Phase.None:
			ResetBall()
			print_debug("Resetting Ball")
		if currentPhase == Phase.Waiting:
			currentPhase = Phase.Height
			print_debug(str("Going to " , currentPhase , " Stage"))
		elif currentPhase == Phase.Height:
			SetHeight()
			currentPhase = Phase.Distance
			print_debug(str("Going to " , currentPhase , " Stage"))
		elif currentPhase == Phase.Distance:
			SetDistance()
			currentPhase = Phase.Throwing
			print_debug(str("Going to " , currentPhase , " Stage"))
		if currentPhase == Phase.Throwing:
			Ball.gravity_scale = 1
			Throw(Height, Distance)
			currentPhase = Phase.Fetching
			print_debug(str("Going to " , currentPhase , " Stage"))
			DogFetch()

func DogFetch():
	FetchingStarted.emit()

func Throw(height, distance):
	Ball.apply_force(Vector3(0, height* PowerMult, -distance * PowerMult))

func SetHeight():
	Height = 100
func SetDistance():
	Distance = 75
func ResetBall():
	Ball.gravity_scale = 0
	Ball.linear_velocity = Vector3.ZERO
	Ball.position = BallStart
	
func ReturnBall():
	ResetBall()
	Ball.position = BallStart
	currentPhase = Phase.Waiting
