extends StaticBody2D

@export var health := 500
var isMouseInBounds = false
var isBuildingGUIActive = false
var parent_building = null
const COST = 40
const soldier_COST = [8,0,1]
const tank_COST = [25,10,3]
const sniper_cost = [10,5,1]
var repeat = PlayerData.queue_repeat

const tankScene = preload("res://src/Military/tank.tscn")
const soldierScene = preload("res://src/Military/soldier_basic.tscn")
const sniperScene = preload("res://src/Military/Sniper.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_node("ProgressBar").set_value(health/500)
	repeat = PlayerData.queue_repeat
	
	
	
func take_hit(damage: int):
	health -= damage
	if health < 1:
		destroy_barracks()
		
func spawn_soldier_timer():
	PlayerData.money -= soldier_COST[0]
	PlayerData.energy -= soldier_COST[1]
	PlayerData.score -= soldier_COST[2]
	for child in get_children():
		if child is Timer:
			if child.get_time_left() != 0:
				PlayerData.money += soldier_COST[0]
				PlayerData.energy += soldier_COST[1]
				PlayerData.score += soldier_COST[2]
				return
	$SoldierTimer.set_one_shot(false) 
	if PlayerData.queue_repeat == true:
		$SoldierTimer.set_one_shot(false)	
	else:
		$SoldierTimer.set_one_shot(true)
	$SoldierTimer.start(4)
	print(str($SoldierTimer.is_one_shot()))
	
	
func spawn_tank_timer():
	PlayerData.money -= tank_COST[0]
	PlayerData.energy -= tank_COST[1]
	PlayerData.score -= tank_COST[2]
	for child in get_children():
		if child is Timer:
			if child.get_time_left() != 0:
				PlayerData.money += tank_COST[0]
				PlayerData.energy += tank_COST[1]
				PlayerData.score += tank_COST[2]
				return
	if PlayerData.queue_repeat == true:
		$TankTimer.set_one_shot(false)	
	else:
		$TankTimer.set_one_shot(true)
	$TankTimer.start(8)
	
func spawn_sniper_timer():
	PlayerData.money -= sniper_cost[0]
	PlayerData.energy -= sniper_cost[1]
	PlayerData.score -= sniper_cost[2]
	for child in get_children():
		if child is Timer:
			if child.get_time_left() != 0:
				PlayerData.money += sniper_cost[0]
				PlayerData.energy += sniper_cost[1]
				PlayerData.score += sniper_cost[2]
				return
	if PlayerData.queue_repeat == true:
		$SniperTimer.set_one_shot(false)	
	else:
		$SniperTimer.set_one_shot(true)
	$SniperTimer.start(6)
	
		
func timers_cancel():
	$SoldierTimer.stop()
	$TankTimer.stop()
	$SniperTimer.stop()
	
func spawn_soldier():
	var soldier = soldierScene.instantiate()
	get_tree().get_root().add_child(soldier)
	soldier.global_position.x = 560
	soldier.global_position.y = randf_range(220, 450)
	if $TankTimer.is_one_shot() == false and PlayerData.money >= tank_COST[0] and PlayerData.energy >= tank_COST[1] and PlayerData.score >= tank_COST[2]:
		PlayerData.money -= soldier_COST[0]
		PlayerData.energy -= soldier_COST[1]
		PlayerData.score -= soldier_COST[2]
	else:
		$TankTimer.stop()
	
func spawn_tank():
	var tank = tankScene.instantiate()
	get_tree().get_root().add_child(tank)
	tank.global_position.x = 560
	tank.global_position.y = randf_range(220, 450)
	if $TankTimer.is_one_shot() == false and PlayerData.money >= tank_COST[0] and PlayerData.energy >= tank_COST[1] and PlayerData.score >= tank_COST[2]:
		PlayerData.money -= tank_COST[0]
		PlayerData.energy -= tank_COST[1]
		PlayerData.score -= tank_COST[2]
	else:
		$TankTimer.stop()
		
func spawn_sniper():
	var sniper = sniperScene.instantiate()
	get_tree().get_root().add_child(sniper)
	sniper.global_position.x = 560
	sniper.global_position.y = randf_range(220, 450)
	if $SniperTimer.is_one_shot() == false and PlayerData.money >= sniper_cost[0] and PlayerData.energy >= sniper_cost[1] and PlayerData.score >= sniper_cost[2]:
		PlayerData.money -= sniper_cost[0]
		PlayerData.energy -= sniper_cost[1]
		PlayerData.score -= sniper_cost[2]
	else:
		$SniperTimer.stop()
	
func destroy_barracks() -> void:
	parent_building.unhide_building()
	queue_free()
	
	
func _input(event):
	if event.is_action_released("select") && isMouseInBounds:
		var barracksSelect = get_parent().find_child("ControlPanel").find_child("BarracksSelect")
		if isBuildingGUIActive:
			barracksSelect.set_visible(false)
			isBuildingGUIActive = false
			PlayerData.selectedBuilding = null
		elif PlayerData.selectedBuilding == null:
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


func _on_sniper_timer_timeout():
	spawn_sniper()
