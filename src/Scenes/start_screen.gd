extends Control


func _on_play_button_button_up():
	get_tree().change_scene_to_file("res://src/Scenes/BattleScene.tscn")


func _on_help_button_button_up():
	$ColorRect2.visible = true


func _on_hide_button_button_up():
	$ColorRect2.visible = false
