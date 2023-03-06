extends ParallaxBackground


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func _input(event):
	if event.is_action("select"):
		get_parent().find_child("ControlPanel").find_child("HBoxContainer").set_visible(false)
