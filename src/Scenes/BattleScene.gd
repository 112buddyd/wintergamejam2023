extends Node2D

const greyman_scene = preload("res://src/Enemies/Greyman.tscn")

var timer = 0
var level_one_cooldown_timer = 25

func _process(delta):
	timer += delta
	if timer > 94:
		level_one(delta)
		print(level_one_cooldown_timer)
	
func spawn_greyman(spawn_amount: int):
	for spawn in spawn_amount:
		var greyman = greyman_scene.instantiate()
		get_tree().get_root().add_child(greyman)
		greyman.position.x = $AlienSpawner.global_position.x
		greyman.position.y = randf_range(158, 470)
	
func level_one(delta):
	if level_one_cooldown_timer <= 0:
		spawn_greyman(2)
		level_one_cooldown_timer = 25
	else:
		level_one_cooldown_timer -= delta
	
