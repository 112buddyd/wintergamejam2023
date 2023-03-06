extends ItemList

var isMouseInBounds = false;
const barracksScene = preload("res://src/buildings/barracks.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass





func _on_item_activated(index):
	var barracksScript = load("res://src/Buildings/barracks.gd")
	if index == 0:
		if PlayerData.money >= barracksScript.COST:
			PlayerData.money -= barracksScript.COST
			var barrack = barracksScene.instantiate()
			find_parent("BattleScreen").add_child(barrack)
			barrack.global_position = PlayerData.selectedBuilding.global_position
			barrack.global_position.y -= 40
			find_parent("BuildingSelect").set_visible(false)
			PlayerData.selectedBuilding.queue_free()
			PlayerData.selectedBuilding = null
		else:
			var messageLabel = get_parent().find_child("Message")
			messageLabel.set_text("Cannot Afford! Please select another choice.")
			var labelSettings = LabelSettings.new()
			labelSettings.set_font_size(16)
			labelSettings.set_font_color(Color(0,255,255,255))
			messageLabel.set_label_settings(labelSettings)
			

		

		
		
