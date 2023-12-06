extends Node2D
onready var pipe1 = preload("res://FluidSim2D/Pipe2.tscn")
onready var pipe2 = preload("res://FluidSim2D/Pipe1.tscn")


func _on_Pipe2_button_down():
	var pip = pipe2.instance()
	pip.position = Vector2(0,0)
	add_child(pip)


func _on_Pipe1_button_down():
	var pip = pipe1.instance()
	pip.position = Vector2(0,0)
	add_child(pip)
