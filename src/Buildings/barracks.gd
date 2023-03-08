extends StaticBody2D

@export var health := 500
var isMouseInBounds = false
var isBuildingGUIActive = false
var parent_building = null
const COST = 100

const tankScene = preload("res://src/Military/tank.tscn")
const soldierScene = preload("res://src/Military/soldier_basic.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_node("ProgressBar").set_value(health/500)
	
	
	
func take_hit(damage: int):
	health -= damage
	if health < 1:
		destroy_barracks()
		
func spawn_soldier_timer():
	print("activate")
	for child in get_children():
		if child is Timer:
			if child.get_time_left() != 0:
				return
	$SoldierTimer.set_one_shot(PlayerData.queue_repeat)
	$SoldierTimer.start(3)
	print(str($SoldierTimer.is_one_shot()))
	
	
func spawn_tank_timer():
	for child in get_children():
		if child is Timer:
			if child.get_time_left() != 0:
				return
	$TankTimer.set_one_shot(PlayerData.queue_repeat)
	$TankTimer.start(5)
	
		
func timers_cancel():
	$SoldierTimer.stop()
	$TankTimer.stop()
	
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
	parent_building.unhide_building()
	queue_free()
	
	
func _input(event):
	if event.is_action_released("select") && isMouseInBounds:
		var barracksSelect = get_parent().find_child("ControlPanel").find_child("BarracksSelect")
		if isBuildingGUIActive:
			barracksSelect.set_visible(false)
			isBuildingGUIActive = false
		else:
			barracksSelect.set_visible(true)
			isBuildingGUIActive = true
			PlayerData.selectedBuilding = self
		get_viewport().set_input_as_handled()
	

func _on_mouse_entered():
	isMouseInBounds = true


func _on_mouse_exited():
	isMouseInBounds = false


func _on_tank_timer_timeout():
	spawn_tank()


func _on_soldier_timer_timeout():
	spawn_soldier()
