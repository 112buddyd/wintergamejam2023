extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if len(get_tree().get_nodes_in_group("mortar")) > 0:
		$Panel/MortarLabel.visible = true
	else:
		$Panel/MortarLabel.visible = false

func clear():
	for child in find_child("Panel").get_children():
		if child.name != "HUD":
			child.set_visible(false)
