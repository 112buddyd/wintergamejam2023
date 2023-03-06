extends StaticBody2D
var isMouseInBounds = false;
var isBuildingGUIActive = false;
@export var health := 100 
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	if event.is_action_released("select") && isMouseInBounds:
		var controlPanel = get_parent().get_parent().find_child("ControlPanel")
		if isBuildingGUIActive:
			controlPanel.find_child("HBoxContainer").set_visible(false)
			isBuildingGUIActive = false
			PlayerData.selectedBuilding = null
		else:
			controlPanel.find_child("HBoxContainer").set_visible(true)
			isBuildingGUIActive = true
			PlayerData.selectedBuilding = find_child("CollisionPolygon2D")
		get_viewport().set_input_as_handled()
	
func _mouse_enter():
	isMouseInBounds = true
	
func _mouse_exit():
	isMouseInBounds = false
func take_hit(damage: int):
	health -= damage
	if health < 1:
		destroy_barracks()


func destroy_barracks() -> void:
	queue_free()
