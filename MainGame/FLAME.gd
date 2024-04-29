extends AnimatedSprite2D






# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Singleton.temperature > 0.8:
		self.visible = true
		self.play("default")
	else:
		self.visible = false
