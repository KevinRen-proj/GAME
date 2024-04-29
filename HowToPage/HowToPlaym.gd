extends Node2D

@onready var buttonBack = $Button as Button
#@onready var MAIN_MENU = preload("res://MainMenu/main_menu.tscn") as PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().paused = false
	buttonBack.button_up.connect(on_button_up)
	pass



func on_button_up():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://MainMenu/main_menu.tscn")
	


