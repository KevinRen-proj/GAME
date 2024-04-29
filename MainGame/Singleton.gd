extends Node

var cooling_speed = 0
var slowDownRate = 0.005
var temperature = 0
var mathAnswer = 0
var deathMeter = 0
var entered = false
var mathCorrect = true
var withinBoarder = false
var userInputGraphic: Vector2i
var answerGraphic: Vector2i
var GraphicCorrect = true
var GraphicComplete = false
var gameEnd = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	slow_cooling(delta)
	if deathMeter >= 100 or temperature >= 100:
		gameEnd = true
	#if deathMeter >= 100:
		#YOU LOSE
	
func reset_cooling():
	cooling_speed = 0

func slow_cooling(delta):
	if cooling_speed > 0:
		cooling_speed -= slowDownRate * delta

#For the Math display
func set_mathAnswer(a):
	mathAnswer = a

func increase_deathMeterMATH():
	deathMeter += 10
	mathCorrect = false
	

func increse_deathMeterGRAPHIC():
	deathMeter += 20
	GraphicCorrect = false
	
	

func set_userInputGraphic(a):
	userInputGraphic = a



