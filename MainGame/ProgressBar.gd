extends ProgressBar
var increase_rate = 0.05
var progress_value = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	Singleton.temperature += increase_rate * delta
	Singleton.temperature -= Singleton.cooling_speed * delta
	Singleton.temperature = clamp(Singleton.temperature, 0, 1)
	value = Singleton.temperature
	
