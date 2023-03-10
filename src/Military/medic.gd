extends CharacterBody2D


@export var speed := 80
@export var damage := -2
@export var shoot_distance_init : float = 400
@export var health := 50
@export var reload_time = 0.2

const bullet_scene = preload("res://src/bullets/BSBullet.tscn")

var close_enemy
var timer = reload_time
var resume_velocity = 0
var actor_velocity = Vector2.ZERO
var max_health = health


# Called when the node enters the scene tree for the first time.
func _ready():
	actor_velocity.x = speed
	resume_velocity = actor_velocity.x


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if timer <= reload_time:
		timer += _delta
	if timer > reload_time and PlayerData.player_retreat == false:
		var shoot_distance = shoot_distance_init
		var all_enemy = get_tree().get_nodes_in_group("playermovable")
		for enemy in all_enemy:
			var fire_to_enemy_distance = position.distance_to(enemy.position)
			if fire_to_enemy_distance < shoot_distance and enemy.get_health() < enemy.get_max_health():
				timer -= reload_time
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
	if close_enemy.has_method("take_hit") and close_enemy.health < close_enemy.max_health:
		close_enemy.take_hit(damage)
		print(str(close_enemy.health))
	
func take_hit(damage: int):
	health -= damage
	if health < 1:
		queue_free()
		
func get_health():
	return health
	
func get_max_health(): 
	return max_health
