extends CharacterBody2D


@export var speed := 75
@export var damage := 5
@export var shoot_distance_init : float = 250
@export var health := 35
@export var reload_time = 0.8

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
		var all_enemy = get_tree().get_nodes_in_group("enemy")
		for enemy in all_enemy:
			var fire_to_enemy_distance = position.distance_to(enemy.position)
			if fire_to_enemy_distance < shoot_distance:
				timer -= reload_time
				shoot_distance = fire_to_enemy_distance
				close_enemy = enemy
				gm_shoot(close_enemy)
				return
		actor_velocity.x = resume_velocity
		if self.global_position.x >= 3240:
			actor_velocity.x = 0
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
	bullet.position = $BSBS.global_position
	bullet.linear_velocity = close_enemy.global_position - bullet.position
	bullet.damage = damage
	

func take_hit(damage: int):
	health -= damage
	if health < 1:
		queue_free()
		
func get_health():
	return health
	
func get_max_health(): 
	return max_health
