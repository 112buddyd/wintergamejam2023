extends ItemList
var barracksScript = preload("res://src/Buildings/barracks.gd")
var bankScript = preload("res://src/Buildings/bank.gd")
var isMouseInBounds = false;
const barracksScene = preload("res://src/buildings/barracks.tscn")
const bankScene = preload("res://src/buildings/bank.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass





func _on_item_activated(index):
	if index == 0:
		if PlayerData.money >= barracksScript.COST:
			PlayerData.money -= barracksScript.COST
			var barrack = barracksScene.instantiate()
			find_parent("BattleScreen").add_child(barrack)
			barrack.global_position = PlayerData.selectedBuilding.global_position
			find_parent("BuildingSelect").set_visible(false)
			PlayerData.selectedBuilding = null
		else:
			cannotAffordMessage()
	elif index == 2:
		if PlayerData.money >= bankScript.COST:
			PlayerData.money -= bankScript.COST
			var bank = bankScene.instantiate()
			find_parent("BattleScreen").add_child(bank)
			bank.global_position = PlayerData.selectedBuilding.global_position
			find_parent("BuildingSelect").set_visible(false)
			PlayerData.selectedBuilding = null
		else:
			cannotAffordMessage()
			
		
		
func cannotAffordMessage():
	var messageLabel = get_parent().find_child("Message")
	messageLabel.set_text("Cannot Afford! Please select another choice.")
	messageLabel.get_label_settings().set_font_size(16)
		
		
