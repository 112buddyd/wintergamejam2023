extends Control

var end_string = "The City has fallen but not all is lost. You have managed to save %s people from the alien horde."
var final_score = PlayerData.score
var format_string = end_string % str(final_score)



func _ready():
	$EndLabel.set_text(format_string)
