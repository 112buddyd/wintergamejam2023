extends Control

var end_string = "The City has fallen but not all is lost.\nYou have managed to save %s thousand people from the alien horde."
var final_score = PlayerData.score
var format_string = end_string % str(final_score)



func _ready():
	$EndLabel.set_text(format_string)
