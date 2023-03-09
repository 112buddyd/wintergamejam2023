extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func clear():
	for child in find_child("Panel").get_children():
		if child.name != "HUD":
			child.set_visible(false)
