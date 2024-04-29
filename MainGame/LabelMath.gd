extends Label

var rng = RandomNumberGenerator.new()
var num1 = rng.randi_range(1,99)
var num2 = rng.randi_range(1,99)
var timer := Timer.new()
var randSec = rng.randf_range(0.1,5.0)
var timer_started = false



# Called when the node enters the scene tree for the first time.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	roll_math()
	


func roll_math():
	if timer_started == false:
		num1 = rng.randi_range(1,99)
		num2 = rng.randi_range(1,10)
		self.text = str(num1)+"+"+str(num2)
		var answer = num1+num2
		Singleton.set_mathAnswer(answer)
		timer_started = true
		await get_tree().create_timer(5).timeout
		if Singleton.entered == false:
			self.text = "TOO SLOW"
			Singleton.increase_deathMeterMATH()
		randSec = rng.randf_range(0.1,8)
		await get_tree().create_timer(randSec).timeout
		timer_started = false
		Singleton.entered = false
		
	
	


	


func _on_input_text_submitted(new_text):
	if Singleton.mathCorrect:
		self.text = "Correct"
	else:
		self.text = "WRONG"
		
	



