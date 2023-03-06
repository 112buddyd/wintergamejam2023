extends CharacterBody2D

@onready var anim = $Explosion/AnimationPlayer

@export var linear_velocity = Vector2(0, 0)
@export var speed = 1000
@export var LIFETIME_DURATION = 5
var force_explode_timer = LIFETIME_DURATION
var damage = 10

func _ready():
	pass


func _physics_process(delta):
	force_explode_timer -= delta
	if force_explode_timer < 0:
		explode()

	var collision = move_and_collide(linear_velocity.normalized() * delta * speed)
	if collision and collision.get_collider().has_method("take_hit"):
		collision.get_collider().take_hit(damage)
		explode()



func explode():
	anim.play("shellExplode")


func finish_explode():
	queue_free()
	
