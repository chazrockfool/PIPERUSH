extends KinematicBody2D

var dragging = false

signal dragsignal;

func _ready():
	connect("dragsignal",self,"_set_drag_pc")
	get_node("Mouse").disabled = true
	
	
func _process(delta):
	if dragging:
		get_node("Mouse").disabled = false
		var mousepos = get_global_mouse_position()
		self.position = Vector2(mousepos.x, mousepos.y)
		if Input.is_action_just_pressed("rotatebutton"):
			self.rotation_degrees += 90

		

func _set_drag_pc():
	dragging=!dragging
	get_node("Mouse").disabled = true


func _on_Pipe1_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			emit_signal("dragsignal")
		elif event.button_index == BUTTON_LEFT and !event.pressed:
			emit_signal("dragsignal")
	elif event is InputEventScreenTouch:
		if event.pressed and event.get_index() == 0:
			self.position = event.get_position()


func _on_Pipe_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			emit_signal("dragsignal")
		elif event.button_index == BUTTON_LEFT and !event.pressed:
			emit_signal("dragsignal")
	elif event is InputEventScreenTouch:
		if event.pressed and event.get_index() == 0:
			self.position = event.get_position()

