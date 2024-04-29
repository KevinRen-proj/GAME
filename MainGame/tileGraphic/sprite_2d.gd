extends Sprite2D

var greenTile = load("res://MainGame/tileGraphic/sprite_2d.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Singleton.GraphicCorrect == false or Singleton.GraphicComplete == true:
		get_tree().call_group("greenTile", "queue_free")
		print("Clear")
		Singleton.deathMeter -= 10
		#Singleton.GraphicCorrect = true
		#Singleton.GraphicComplete = false
		
		
		

