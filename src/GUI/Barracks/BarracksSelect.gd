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
	if index == 0:
		barrack = PlayerData.selectedBuilding
		if PlayerData.money >= barracksScript.soldier_COST[0] and PlayerData.energy >= barracksScript.soldier_COST[1] and PlayerData.score >= barracksScript.soldier_COST[2]:
			barrack.spawn_soldier_timer()
		else:
			get_parent().find_child("Message").set_text("Can't afford!")
	if index == 1:

		if PlayerData.money >= barracksScript.tank_COST[0] and PlayerData.energy >= barracksScript.tank_COST[1] and PlayerData.score >= barracksScript.tank_COST[2]:
			barrack.spawn_tank_timer()
		else:
			get_parent().find_child("Message").set_text("Can't afford!")
	if index == 2:

		if PlayerData.money >= barracksScript.sniper_cost[0] and PlayerData.energy >= barracksScript.sniper_cost[1] and PlayerData.score >= barracksScript.sniper_cost[2]:
			barrack.spawn_sniper_timer()
		else:
			get_parent().find_child("Message").set_text("Can't afford!")
	if index == 3:
		barrack = PlayerData.selectedBuilding
		barrack.timers_cancel()
			
