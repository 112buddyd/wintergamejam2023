extends CharacterBody2D


@export var speed := 80
@export var damage_main := 30
@export var shoot_distance_init_main : float = 600
@export var health := 200
@export var reload_time_main = 6.0
@export var reload_time_secondary = 0.5
@export var shoot_distance_init_secondary : float = 350
@export var damage_secondary := 4

const bullet_scene = preload("res://src/bullets/BSBullet.tscn")
const tank_shell_scene = preload("res://src/bullets/TankShell.tscn")

var close_enemy
var timer_main = reload_time_main
var timer_secondary = reload_time_secondary
var resume_velocity = 0
var actor_velocity = Vector2.ZERO
var max_health = health


# Called when the node enters the scene tree for the first time.
func _ready():
	actor_velocity.x = speed
	resume_velocity = actor_velocity.x


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if timer_main <= reload_time_main:
		timer_main += _delta
	if timer_secondary <= reload_time_secondary:
		timer_secondary += _delta
	if timer_main > reload_time_main and PlayerData.player_retreat == false:
		var shoot_distance = shoot_distance_init_main
		var all_enemy = get_tree().get_nodes_in_group("enemy")
		for enemy in all_enemy:
			var fire_to_enemy_distance = position.distance_to(enemy.position)
			if fire_to_enemy_distance < shoot_distance:
				timer_main -= reload_time_main
				shoot_distance = fire_to_enemy_distance
				close_enemy = enemy
				gm_shoot_shell(close_enemy)
				return
		actor_velocity.x = resume_velocity
	else:
		actor_velocity.x = 0
	if timer_secondary > reload_time_secondary and PlayerData.player_retreat == false:
		var shoot_distance = shoot_distance_init_secondary
		var all_enemy = get_tree().get_nodes_in_group("enemy")
		for enemy in all_enemy:
			var fire_to_enemy_distance = position.distance_to(enemy.position)
			if fire_to_enemy_distance < shoot_distance:
				timer_secondary -= reload_time_secondary
				shoot_distance = fire_to_enemy_distance
				close_enemy = enemy
				gm_shoot(close_enemy)
				return
		actor_velocity.x = resume_velocity
	else:
		actor_velocity.x = 0
	if PlayerData.player_hold == true:
		actor_velocity.x = 0
	if PlayerData.player_retreat == true:
		actor_velocity.x = resume_velocity * -1.0
		if self.global_position.x <= 580:
			actor_velocity.x = 0
	set_velocity(actor_velocity)
	move_and_slide()
	
	

func gm_shoot(close_enemy):
	var bullet = bullet_scene.instantiate()
	get_tree().get_root().add_child(bullet)
	bullet.position = $FiftyCalShoot.global_position
	bullet.linear_velocity = close_enemy.global_position - bullet.position
	bullet.damage = damage_main
	
	
func gm_shoot_shell(close_enemy):
	var bullet = tank_shell_scene.instantiate()
	get_tree().get_root().add_child(bullet)
	bullet.position = $TankShoot.global_position
	bullet.linear_velocity = close_enemy.global_position - bullet.position
	bullet.damage = damage_main
	bullet.enemy_position_x = close_enemy.global_position.x
	

func take_hit(damage: int):
	health -= damage
	if health < 1:
		queue_free()
		
func get_health():
	return health
	
func get_max_health(): 
	return max_health
