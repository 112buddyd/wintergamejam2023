extends CharacterBody2D

@export var linear_velocity = Vector2(0.0, 0.0)
@export var LIFETIME_DURATION = 5
var force_explode_timer = LIFETIME_DURATION

func _ready():
	print("bullet")

func _physics_process(delta):
	force_explode_timer -= delta
	if force_explode_timer < 0:
		explode()
	
	var collision = move_and_collide(linear_velocity * delta)
	if collision:	
		explode()
	
	

func explode():
	queue_free()
