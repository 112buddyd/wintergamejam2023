extends Node2D

const greyman_scene = preload("res://src/Enemies/Greyman.tscn")
const alien_tank_scene = preload("res://src/Enemies/alienTank.tscn")
const alien_mortar_scene = preload("res://src/Enemies/alien_mortar.tscn")

var timer = 0 # Timer starts at zero and adds delta. HGigher timer goes more difficult
var level_cooldown_timer = 0

# Basic incrementing difficulty

func _process(delta): # When the timer hits thresholds waves start to appear
	timer += delta
	if timer > 60:
		level_one(delta)
	if timer > 90:
		level_two(delta)
	if timer > 120:
		level_three(delta)
	if timer > 150:
		level_four(delta)
	if timer > 180:
		level_five(delta)
	if timer > 210:
		level_six(delta)
	if timer > 240:
		level_seven(delta)
	if timer > 270:
		level_eight(delta)
	if timer > 300:
		level_nine(delta)
	if timer > 330:
		level_ten(delta)
	if timer > 360:
		level_eleven(delta)
	if timer > 390:
		level_twelve(delta)
	if timer > 420:
		level_thirteen(delta)


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
		
func spawn_alien_mortar(spawn_amount: int): # Spawns greymen at random locations
	for spawn in spawn_amount:
		var alien_mortar = alien_mortar_scene.instantiate()
		get_tree().get_root().add_child(alien_mortar)
		alien_mortar.position.x = $AlienSpawner.global_position.x
		alien_mortar.position.y = randf_range(300, 400)
	
func level_one(delta): # First level, can use as a template
	if level_cooldown_timer <= 0:
		spawn_greyman(2)
		level_cooldown_timer = 5
	else:
		level_cooldown_timer -= delta
		
func level_two(delta): 
	if level_cooldown_timer <= 0:
		spawn_greyman(4)
		level_cooldown_timer = 11
	else:
		level_cooldown_timer -= delta
func level_three(delta): 
	if level_cooldown_timer <= 0:
		spawn_greyman(3)
		spawn_alien_tank(1)
		level_cooldown_timer = 13
	else:
		level_cooldown_timer -= delta
		
func level_four(delta): 
	if level_cooldown_timer <= 0:
		spawn_greyman(4)
		level_cooldown_timer = 17
	else:
		level_cooldown_timer -= delta
		
func level_five(delta):
	if level_cooldown_timer <= 0:
		spawn_greyman(3)
		spawn_alien_mortar(1)
		level_cooldown_timer = randf_range(45, 65)
	else:
		level_cooldown_timer -= delta
		
func level_six(delta):
	if level_cooldown_timer <= 0:
		spawn_greyman(3)
		spawn_alien_tank(1)
		level_cooldown_timer = 19
	else:
		level_cooldown_timer -= delta
		
func level_seven(delta):
	if level_cooldown_timer <= 0:
		spawn_greyman(5)
		spawn_alien_tank(2)
		level_cooldown_timer = 23
	else:
		level_cooldown_timer -= delta
		
func level_eight(delta):
	if level_cooldown_timer <= 0:
		spawn_greyman(5)
		spawn_alien_tank(2)
		level_cooldown_timer = 29
	else:
		level_cooldown_timer -= delta
		
func level_nine(delta):
	if level_cooldown_timer <= 0:
		spawn_greyman(7)
		spawn_alien_tank(3)
		level_cooldown_timer = 31
	else:
		level_cooldown_timer -= delta

func level_ten(delta):
	if level_cooldown_timer <= 0:
		spawn_greyman(7)
		spawn_alien_tank(3)
		level_cooldown_timer = randf_range(90, 120)
	else:
		level_cooldown_timer -= delta
		
func level_eleven(delta):
	if level_cooldown_timer <= 0:
		spawn_greyman(7)
		spawn_alien_tank(3)
		level_cooldown_timer = 37
	else:
		level_cooldown_timer -= delta
		
func level_twelve(delta):
	if level_cooldown_timer <= 0:
		spawn_greyman(7)
		spawn_alien_tank(3)
		level_cooldown_timer = 41
	else:
		level_cooldown_timer -= delta
		
func level_thirteen(delta):
	if level_cooldown_timer <= 0:
		spawn_greyman(10)
		spawn_alien_tank(5)
		level_cooldown_timer = randf_range(90, 120)
	else:
		level_cooldown_timer -= delta
		
