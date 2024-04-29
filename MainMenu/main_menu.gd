class_name MainMenu
extends Control


@onready var buttonStart = $MarginContainer/HBoxContainer/VBoxContainer/ButtonStart as Button
@onready var buttonHowTo = $MarginContainer/HBoxContainer/VBoxContainer/ButtonHowTo as Button
@onready var buttonExit = $MarginContainer/HBoxContainer/VBoxContainer/ButtonExit as Button
#@onready var start = preload("res://MainGame/main.tscn") as PackedScene
#@onready var HOW_TO_PLAY = preload("res://HowToPage/HowToPlay.tscn") as PackedScene


func _ready():
	get_tree().paused = false
	buttonStart.button_up.connect(on_button_up)
	buttonHowTo.button_up.connect(on_howto_up)
	buttonExit.button_up.connect(on_exit_up)
	
func on_button_up() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://MainGame/main.tscn")

func on_howto_up() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://HowToPage/HowToPlay.tscn")

func on_exit_up() -> void:
	get_tree().paused = false
	get_tree().quit()




"""
func _process(delta):
	print("w")

func _on_button_start_button_up():
	print("yes")
	get_tree().paused = false
	get_tree().change_scene_to_packed(start)
	
	



func _on_button_how_to_button_up():
	print("yes")
	get_tree().paused = false
	get_tree().change_scene_to_packed(HOW_TO_PLAY)
	


func _on_button_exit_button_up():
	print("yes")
	get_tree().paused = false
	get_tree().quit()
"""


