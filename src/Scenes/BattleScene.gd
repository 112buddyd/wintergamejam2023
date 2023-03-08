extends Node2D

const greyman_scene = preload("res://src/Enemies/Greyman.tscn")

var timer = 0 # Timer starts at zero and adds delta. HGigher timer goes more difficult
var level_one_cooldown_timer = 0
var level_two_cooldown_timer = 0

# Basic incrementing difficulty

func _process(delta): # When the timer hits thresholds waves start to appear
	timer += delta
	if timer > 30:
		level_one(delta)
	if timer > 150:
		level_two(delta)

	
func spawn_greyman(spawn_amount: int): # Spawns greymen at random locations
	for spawn in spawn_amount:
		var greyman = greyman_scene.instantiate()
		get_tree().get_root().add_child(greyman)
		greyman.position.x = $AlienSpawner.global_position.x
		greyman.position.y = randf_range(220, 470)
	
func level_one(delta): # First level, can use as a template
	if level_one_cooldown_timer <= 0:
		spawn_greyman(2)
		level_one_cooldown_timer = 13
	else:
		level_one_cooldown_timer -= delta
		
func level_two(delta): # First level, can use as a template
	if level_one_cooldown_timer <= 0:
		spawn_greyman(5)
		level_one_cooldown_timer = 17
	else:
		level_one_cooldown_timer -= delta
		
