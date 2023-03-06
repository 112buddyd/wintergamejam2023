extends CharacterBody2D

@export var baseSpawnRate = 1
@export var level := 1
@export var health := 500
var isMouseInBounds = false
var timer = 0; 
const COST = 100
var isBuildingGUIActive = false

const soldierScene = preload("res://src/Military/soldier_basic.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timer += delta
	if timer >= (baseSpawnRate * level):
		spawn_soldier()
		timer = 0
	
	
func take_hit(damage: int):
	health -= damage
	if health < 1:
		destroy_barracks()
		
func spawn_soldier():
	var soldier = soldierScene.instantiate()
	soldier.set_global_position(global_position)
	get_tree().get_root().add_child(soldier)

func destroy_barracks() -> void:
	queue_free()
	
func level_up():
	level += 1
	
	
func _input(event):
	if event.is_action_released("select") && isMouseInBounds:
		var controlPanel = get_tree().get_root().find_child("ControlPanel")
		if isBuildingGUIActive:
			controlPanel.find_child("BuildingSelect").set_visible(false)
			isBuildingGUIActive = false
			PlayerData.selectedBuilding = null
		else:
			controlPanel.find_child("BuildingSelect").set_visible(true)
			isBuildingGUIActive = true
			PlayerData.selectedBuilding = self
		get_viewport().set_input_as_handled()
	

func _on_mouse_entered():
	isMouseInBounds = true


func _on_mouse_exited():
	isMouseInBounds = false
