extends Node2D

const greyman_scene = preload("res://src/Enemies/Greyman.tscn")
const alien_tank_scene = preload("res://src/Enemies/alienTank.tscn")

var timer = 0 # Timer starts at zero and adds delta. HGigher timer goes more difficult
var level_cooldown_timer = 0

# Basic incrementing difficulty

func _process(delta): # When the timer hits thresholds waves start to appear
	timer += delta
	if timer > 0:
		level_one(delta)
	if timer > 60:
		level_two(delta)
	if timer > 90:
		level_three(delta)

	
func spawn_greyman(spawn_amount: int): # Spawns greymen at random locations
	for spawn in spawn_amount:
		var greyman = greyman_scene.instantiate()
		get_tree().get_root().add_child(greyman)
		greyman.position.x = $AlienSpawner.global_position.x
		greyman.position.y = randf_range(220, 470)
		
func spawn_alien_tank(spawn_amount: int): # Spawns greymen at random locations
	for spawn in spawn_amount:
		var alien_tank = alien_tank_scene.instantiate()
		get_tree().get_root().add_child(alien_tank)
		alien_tank.position.x = $AlienSpawner.global_position.x
		alien_tank.position.y = randf_range(220, 470)
	
func level_one(delta): # First level, can use as a template
	if level_cooldown_timer <= 0:
		spawn_greyman(2)
		level_cooldown_timer = 5
	else:
		level_cooldown_timer -= delta
		
func level_two(delta): 
	if level_cooldown_timer <= 0:
		spawn_greyman(4)
		spawn_alien_tank(1)
		level_cooldown_timer = 8
	else:
		level_cooldown_timer -= delta
func level_three(delta): 
	if level_cooldown_timer <= 0:
		spawn_greyman(6)
		spawn_alien_tank(3)
		level_cooldown_timer = 10
	else:
		level_cooldown_timer -= delta
		
