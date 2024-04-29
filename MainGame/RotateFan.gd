extends Sprite2D


var fanSpeed = 0;
var slowDownRate = 0.00005


func _unhandled_input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if get_rect().has_point(to_local(event.position)):
			if fanSpeed < 0.1:
				fanSpeed+=0.01
				Singleton.cooling_speed += 0.01


func slowAcc(delta):
	if fanSpeed > 0:
		fanSpeed=fanSpeed - slowDownRate
	
func raiseLowTemp(delta):
	if Singleton.temperature > 0:
		Singleton.temperature = Singleton.temperature- fanSpeed;


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rotate(fanSpeed)
	slowAcc(delta)
	if fanSpeed < 0.01:
		Singleton.cooling_speed = 0
	pass



