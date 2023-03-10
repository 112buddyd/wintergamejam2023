extends ItemList


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
	
	var player_hold = true
var player_attack = false
var player_retreat = false


func _on_item_activated(index):
	if index == 0:
		PlayerData.player_retreat = true
		PlayerData.player_hold = false
		PlayerData.player_attack = false
	elif index == 1:
		PlayerData.player_hold = true
		PlayerData.player_retreat = false
		PlayerData.player_attack = false
	elif index == 2:
		PlayerData.player_retreat = false
		PlayerData.player_hold = false
		PlayerData.player_attack = true
