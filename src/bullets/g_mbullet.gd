extends CharacterBody2D

@export var linear_velocity = Vector2(0, 0)
@export var speed = 1000
@export var LIFETIME_DURATION = 5
var force_explode_timer = LIFETIME_DURATION
var damage = 2500

func _ready():
	print("bullet")


func _physics_process(delta):
	force_explode_timer -= delta
	if force_explode_timer < 0:
		explode()
	
	var collision = move_and_collide(linear_velocity.normalized() * delta * speed)
	if collision and collision.get_collider().has_method("take_hit"):
		collision.get_collider().take_hit(damage)
		explode()
	
	

func explode():
	print("Explode")
	queue_free()
