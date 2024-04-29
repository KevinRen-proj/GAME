extends Node2D


#Handels the signal (input) from the user from Math Input
func _on_input_text_submitted(new_text):
	var answer = int(new_text)
	if answer == Singleton.mathAnswer:
		print("You are right")
		Singleton.entered = true
		Singleton.mathCorrect = true
	else:
		print("you are wrong")
		Singleton.increase_deathMeterMATH()
		Singleton.entered = true

func _process(delta):
	if Singleton.deathMeter >= 100 or Singleton.temperature >= 1:
		get_tree().change_scene_to_file("res://DeathScene/GG.tscn")
