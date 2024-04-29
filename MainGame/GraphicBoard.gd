extends Sprite2D

@export var greenTile: PackedScene
var grid_data: Array
var grid_posX: int
var grid_posY: int
var max_boardSizeX: int = 380
var min_boardSizeX: int = 70
var max_boardSizeY: int = 520
var min_boardSizeY: int = 50
var grid_sizeX: int = max_boardSizeX - min_boardSizeX
var grid_sizeY: int = max_boardSizeY - min_boardSizeY
var cell_size: Vector2i = Vector2i(60,90)
var cell_sizeX: int = 60
var cell_sizeY: int = 90
var temp: Vector2i = Vector2i(0,0)

# Called when the node enters the scene tree for the first time.
func _ready():
	new_game()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
		

func _input(event):
	
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			#Check if mouse in on the board
			if event.position.x > min_boardSizeX and event.position.x < max_boardSizeX and event.position.y < max_boardSizeY and event.position.y > min_boardSizeY:
				#Convert mouse position into grid location
				
				Singleton.withinBoarder = true
				grid_posX = (event.position.x -min_boardSizeX) / cell_sizeX
				grid_posY = (event.position.y -min_boardSizeY)/ cell_sizeY
				var grid_pos = Vector2i(grid_posX,grid_posY)
				Singleton.set_userInputGraphic(grid_pos)
				#print(grid_pos)
				#print(event.position)
				if Singleton.GraphicComplete == true or Singleton.GraphicCorrect == false:
					new_game()
					print("Ran")
				
				if grid_data[grid_pos.y][grid_pos.x] == 0:
					grid_data[grid_pos.y][grid_pos.x] = 1
					temp = Vector2i(grid_pos.x*155+cell_size.x+13,grid_pos.y*159+cell_size.y-12)
					create_marker(temp)
					#print(grid_pos)
					
			else:
				Singleton.withinBoarder = false
				
				

func new_game():
	Singleton.GraphicComplete = false
	Singleton.GraphicCorrect = true
	grid_data = [
	[0,0,0,0,0],
	[0,0,0,0,0],
	[0,0,0,0,0],
	[0,0,0,0,0],
	[0,0,0,0,0]
	]
	
func create_marker(pos):
	var tile = greenTile.instantiate()
	tile.position = pos
	add_child(tile)

	

