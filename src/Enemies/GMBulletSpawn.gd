extends Node2D


@export var damage := 2500
@export var shoot_distance : float = 1000

const bullet_scene = preload("res://src/bullets/g_mbullet.tscn")

var close_enemy


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	shoot_distance = 1000.0
	var all_enemy = get_tree().get_nodes_in_group("PlayerBuilding")
	for enemy in all_enemy:
		var fire_to_enemy_distance = position.distance_to(enemy.position)
		if fire_to_enemy_distance < shoot_distance:
			print("Shoot")
			shoot_distance = fire_to_enemy_distance
			close_enemy = enemy
			look_at(close_enemy.position)
			gm_shoot(position + Vector2(0, 0).rotated(rotation), Vector2(0, 0).rotated(rotation))

func gm_shoot(initial_position, movement_vector):
	var bullet = bullet_scene.instantiate()
	bullet.position = initial_position
	bullet.linear_velocity = movement_vector
	add_child(bullet)
	
	
