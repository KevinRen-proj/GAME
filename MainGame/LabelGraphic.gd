extends Label

var count = 0
var count2 = 0
var count3 = 0
var pattern = 0
var correct = ":)"
var timer = false
var answer: Vector2i
var max_boardSizeX: int = 380
var min_boardSizeX: int = 70
var max_boardSizeY: int = 520
var min_boardSizeY: int = 50
var rng = RandomNumberGenerator.new()
var alphabets = ['A','B','C','D','E']

# Called when the node enters the scene tree for the first time.
func _ready():
	generateCoor()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
		pass

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			#Check if mouse in on the board
			await get_tree().create_timer(0.3).timeout
			if Singleton.withinBoarder == true:
				checkAnswer()
				await get_tree().create_timer(1).timeout
				generateCoor()

func generateCoor():
	if pattern == 0:
		if count == 0:
			answer = Vector2i(2,0) #A3
			self.text = alphabets[0]+str(3)
			count=count+1
		elif count == 1:
			answer = Vector2i(1,1) #B2
			self.text = alphabets[1]+str(2)
			count=count+1
		elif count == 2:
			answer = Vector2i(0,2) #C1
			self.text = alphabets[2]+str(1)
			count=count+1
		elif count == 3:
			answer = Vector2i(2,1) #B3
			self.text = alphabets[1]+str(3)
			count=count+1
		elif count == 4:
			answer = Vector2i(2,2) #C3
			self.text = alphabets[2]+str(3)
			count=count+1
		elif count == 5:
			answer = Vector2i(2,3) #D3
			self.text = alphabets[3]+str(3)
			count=count+1
		elif count == 6:
			answer = Vector2i(2,4) #E3
			self.text = alphabets[4]+str(3)
			count=count+1
		elif count == 7:
			answer = Vector2i(3,1) #B4
			self.text = alphabets[1]+str(4)
			count=count+1
		elif count == 8:
			answer = Vector2i(4,2) #C5
			self.text = alphabets[2]+str(5)
			count=count+1
			pattern = 1
	elif pattern == 1:
		count = count+1
		if count2 == 0:
			answer = Vector2i(2,0) #A3
			self.text = alphabets[0]+str(3)
			count2=count2+1
		elif count2 == 1:
			answer = Vector2i(2,1) #B3
			self.text = alphabets[1]+str(3)
			count2=count2+1
		elif count2 == 2:
			answer = Vector2i(2,2) #C3
			self.text = alphabets[2]+str(3)
			count2=count2+1
		elif count2 == 3:
			answer = Vector2i(2,3) #D3
			self.text = alphabets[3]+str(3)
			count2=count2+1
		elif count2 == 4:
			answer = Vector2i(2,4) #E3
			self.text = alphabets[4]+str(3)
			count2=count2+1
		elif count2 == 5:
			answer = Vector2i(0,2) #C1
			self.text = alphabets[2]+str(1)
			count2=count2+1
		elif count2 == 6:
			answer = Vector2i(1,2) #C2
			self.text = alphabets[2]+str(2)
			count2=count2+1
		elif count2 == 7:
			answer = Vector2i(2,2) #C3
			self.text = alphabets[2]+str(3)
			count2=count2+1
		elif count2 == 8:
			answer = Vector2i(3,2) #C4
			self.text = alphabets[2]+str(4)
			count2=count2+1
		elif count2 == 9:
			answer = Vector2i(4,2) #C5
			self.text = alphabets[2]+str(5)
			count2=count2+1
			pattern = 2
	elif pattern == 2:
		count2=count2+1
		if count3 == 0:
			answer = Vector2i(1,1) #B2
			self.text = alphabets[1]+str(2)
			count3=count3+1
		elif count3 == 1:
			answer = Vector2i(2,1) #B3
			self.text = alphabets[1]+str(3)
			count3=count3+1
		elif count3 == 2:
			answer = Vector2i(3,1) #B4
			self.text = alphabets[1]+str(4)
			count3=count3+1
		elif count3 == 3:
			answer = Vector2i(3,2) #C4
			self.text = alphabets[2]+str(4)
			count3=count3+1
		elif count3 == 4:
			answer = Vector2i(3,3) #D4
			self.text = alphabets[3]+str(4)
			count3=count3+1
		elif count3 == 5:
			answer = Vector2i(2,3) #D3
			self.text = alphabets[3]+str(3)
			count3=count3+1
		elif count3 == 6:
			answer = Vector2i(1,3) #D2
			self.text = alphabets[3]+str(2)
			count3=count3+1
		elif count3 == 7:
			answer = Vector2i(1,2) #C2
			self.text = alphabets[2]+str(2)
			count3=count3+1
		elif count3 == 8:
			answer = Vector2i(2,2) #C3
			self.text = alphabets[2]+str(3)
			count3=count3+1
	else:	
		count3=count3+1
		var num1 = rng.randi_range(1,5)
		var alpha = rng.randi_range(0,4)
		answer = Vector2i(num1,alpha)
		self.text = alphabets[alpha]+str(num1)

	
	
	

	
	
func checkAnswer():
	print(answer)
	print(Singleton.userInputGraphic)
	if Singleton.userInputGraphic == answer:
		self.text = ":)"
		if count == 9 or count2 == 10 or count3 == 10:
			Singleton.GraphicComplete = true
			
	else:
		self.text = ":("
		Singleton.increse_deathMeterGRAPHIC()
		pattern = pattern +1
	
	
		
		
