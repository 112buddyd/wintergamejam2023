extends Control

var isMouseInBounds = false;
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _input(event):
	if event.is_action("select") && isMouseInBounds:
		print("test")
		get_viewport().set_input_as_handled()
	
func _on_mouse_entered():
	isMouseInBounds = true
	
func _on_mouse_exited():
	isMouseInBounds = false


