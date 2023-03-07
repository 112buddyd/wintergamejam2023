extends StaticBody2D

@export var baseSpawnRate = 5
@export var level := 1
@export var health := 500
var isMouseInBounds = false
var timer = 0; 
const COST = 100
var isBuildingGUIActive = false

const tankScene = preload("res://src/Military/tank.tscn")
const soldierScene = preload("res://src/Military/soldier_basic.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_node("ProgressBar").set_value(health/500)
	timer += delta
	if timer >= (baseSpawnRate / level):
		if level >= 2:
			spawn_soldier()
			spawn_tank()
		else:
			spawn_soldier()
		timer = 0
	
	
func take_hit(damage: int):
	health -= damage
	if health < 1:
		destroy_barracks()
		
func spawn_soldier():
	var soldier = soldierScene.instantiate()
	get_tree().get_root().add_child(soldier)
	soldier.global_position.x = 420
	soldier.global_position.y = randf_range(158, 470)
func spawn_tank():
	var tank = tankScene.instantiate()
	get_tree().get_root().add_child(tank)
	tank.global_position.x = 420
	tank.global_position.y = randf_range(158, 470)
	
func destroy_barracks() -> void:
	queue_free()
	
func level_up():
	PlayerData.money -= COST
	level += 1
	
	
func _input(event):
	if event.is_action_released("select") && isMouseInBounds:
		var barracksSelect = get_parent().find_child("ControlPanel").find_child("BarracksSelect")
		if isBuildingGUIActive:
			barracksSelect.set_visible(false)
			isBuildingGUIActive = false
			PlayerData.selectedBuilding = null
		else:
			barracksSelect.set_visible(true)
			barracksSelect.find_child("Message").set_text("Level " + str(level))
			isBuildingGUIActive = true
			PlayerData.selectedBuilding = self
		get_viewport().set_input_as_handled()
	

func _on_mouse_entered():
	isMouseInBounds = true


func _on_mouse_exited():
	isMouseInBounds = false
