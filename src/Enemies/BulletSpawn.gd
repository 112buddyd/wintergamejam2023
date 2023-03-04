extends Node2D


@export var shoot_distance : float = 100
var close_enemy

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	shoot_distance = 100.0
	var all_enemy = get_tree().get_nodes_in_group("PlayerBuilding")
	for enemy in all_enemy:
		var fire_to_enemy_distance = position.distance_to(enemy.position)
		if fire_to_enemy_distance < shoot_distance:
			shoot_distance = fire_to_enemy_distance
			close_enemy = enemy
			look_at(close_enemy.position)
