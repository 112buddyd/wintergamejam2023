extends Area2D

@export var speed := -100
@export var damage := 2500
@export var shoot_distance : float = 1000

const bullet_scene = preload("res://src/bullets/g_mbullet.tscn")

var close_enemy
var reload_time = 2.0
var timer = reload_time


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	timer += _delta
	if timer > reload_time:
		shoot_distance = 1000.0
		var all_enemy = get_tree().get_nodes_in_group("PlayerBuilding")
		for enemy in all_enemy:
			var fire_to_enemy_distance = position.distance_to(enemy.position)
			if fire_to_enemy_distance < shoot_distance:
				shoot_distance = fire_to_enemy_distance
				close_enemy = enemy
				look_at(close_enemy.position)
				gm_shoot(close_enemy)
				timer -= reload_time

func gm_shoot(close_enemy):
	var bullet = bullet_scene.instantiate()
	get_tree().get_root().add_child(bullet)
	bullet.position= $GMBulletSpawn.global_position
	bullet.linear_velocity = close_enemy.position - bullet.position
