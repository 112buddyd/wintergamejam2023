extends StaticBody2D
var isMouseInBounds = false;
@export var health := 100 
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	if event.is_action_released("select") && isMouseInBounds:
		var controlPanel = get_parent().find_child("ControlPanel")
		var isSelected = PlayerData.selectedBuilding == self
		if isSelected:
			controlPanel.find_child("BuildingSelect").set_visible(false)
			PlayerData.selectedBuilding = null
		else:
			controlPanel.clear()
			controlPanel.find_child("BuildingSelect").set_visible(true)
			PlayerData.selectedBuilding = self
		get_viewport().set_input_as_handled()
	
func take_hit(damage: int):
	health -= damage
	if health < 1:
		destroy_barracks()


func hide_building():
	$Sprite2D.visible = false
	$CollisionPolygon2D.disabled = true
	
func unhide_building():
	$Sprite2D.visible = true
	$CollisionPolygon2D.disabled = false


func destroy_barracks() -> void:
	queue_free()


func _on_mouse_entered():
	isMouseInBounds = true


func _on_mouse_exited():
	isMouseInBounds = false
