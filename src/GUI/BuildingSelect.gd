extends ItemList
var barracksScript = preload("res://src/Buildings/barracks.gd")
var bankScript = preload("res://src/Buildings/bank.gd")
var powerPlantScript = preload("res://src/Buildings/PowerPlant.gd")
var isMouseInBounds = false;
const barracksScene = preload("res://src/buildings/barracks.tscn")
const bankScene = preload("res://src/buildings/Bank.tscn")
var powerPlantScene = preload("res://src/Buildings/PowerPlant.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass





func _on_item_activated(index):
	if index == 0:
		build(barracksScript, barracksScene)
	elif index == 2:
		build(bankScript, bankScene)
	elif index == 3:
		build(powerPlantScript, powerPlantScene)
			
	
func build(buildingScript, buildingScene):
	if PlayerData.money >= buildingScript.COST:
			PlayerData.money -= buildingScript.COST
			var building = buildingScene.instantiate()
			find_parent("BattleScreen").add_child(building)
			building.global_position = PlayerData.selectedBuilding.global_position
			building.parent_building = PlayerData.selectedBuilding
			print(PlayerData.selectedBuilding)
			find_parent("BuildingSelect").set_visible(false)
			PlayerData.selectedBuilding.hide_building()
			PlayerData.selectedBuilding = null
	else:
		cannotAffordMessage()
	
		
func cannotAffordMessage():
	var messageLabel = get_parent().find_child("Message")
	messageLabel.set_text("Cannot Afford!")
	messageLabel.get_label_settings().set_font_size(16)
		
		
