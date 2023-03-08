extends HBoxContainer

const MONEY_LAYOUT = " Money: "
const ENERGY_LAYOUT = "        Energy: "
const SCORE_LAYOUT = "        Score: "
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_child(0).set_text(MONEY_LAYOUT + str(PlayerData.money))
	get_child(1).set_text(ENERGY_LAYOUT + str(PlayerData.energy))
	get_child(2).set_text(SCORE_LAYOUT + str(PlayerData.score) + "        ")
