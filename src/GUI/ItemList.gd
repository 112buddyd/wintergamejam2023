extends ItemList

var isMouseInBounds = false;
const barracks = preload("res://src/buildings/barracks.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass





func _on_item_activated(index):
	if index == 0:
		var barrack = barracks.instantiate()
		find_parent("BattleScreen").add_child(barrack)
		barrack.global_position = PlayerData.selectedBuilding.global_position
		barrack.global_position.y -= 40
		PlayerData.selectedBuilding.queue_free()
		PlayerData.selectedBuilding = null
		

		
		
