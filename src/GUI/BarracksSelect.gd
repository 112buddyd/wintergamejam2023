extends ItemList

var barracksScript = preload("res://src/Buildings/barracks.gd")
var barrack = PlayerData.selectedBuilding
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_item_activated(index):
	barrack = PlayerData.selectedBuilding
	if index == 0:
		if PlayerData.money >= barracksScript.soldier_COST[0] and PlayerData.energy >= barracksScript.soldier_COST[1] and PlayerData.score >= barracksScript.soldier_COST[2]:
			barrack.spawn_soldier_timer()
		else:
			get_parent().find_child("Message").set_text("Can't afford!")
	elif index == 1:
		if PlayerData.money >= barracksScript.tank_COST[0] and PlayerData.energy >= barracksScript.tank_COST[1] and PlayerData.score >= barracksScript.tank_COST[2]:
			barrack.spawn_tank_timer()
		else:
			get_parent().find_child("Message").set_text("Can't afford!")
	elif index == 2:
		if PlayerData.money >= barracksScript.sniper_cost[0] and PlayerData.energy >= barracksScript.sniper_cost[1] and PlayerData.score >= barracksScript.sniper_cost[2]:
			barrack.spawn_sniper_timer()
		else:
			get_parent().find_child("Message").set_text("Can't afford!")
	elif index == 3:
		if PlayerData.money >= barracksScript.medic_cost[0] and PlayerData.energy >= barracksScript.medic_cost[1] and PlayerData.score >= barracksScript.medic_cost[2]:
			barrack.spawn_medic_timer()
		else:
			get_parent().find_child("Message").set_text("Can't afford!")
	elif index == 4:
		barrack.timers_cancel()
			
