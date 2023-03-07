extends ItemList

var barracksScript = preload("res://src/Buildings/barracks.gd")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_item_activated(index):
	if index == 0:
		var barrack = PlayerData.selectedBuilding
		if PlayerData.money >= barracksScript.COST:
			barrack.level_up()
			barrack.isBuildingGUIActive = false
			get_parent().set_visible(false)
		else:
			get_parent().find_child("Message").set_text("Can't afford!")
			
