extends StaticBody2D
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
	
func _mouse_shape_enter(shape_idx):
	print("check")
	isMouseInBounds = true
	
func _mouse_exit():
	isMouseInBounds = false
