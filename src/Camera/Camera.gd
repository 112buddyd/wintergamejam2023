extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var cameraVelocity = Vector2()
	var speed = 1000
	cameraVelocity = Vector2()
	if Input.is_action_pressed("move_camera_right")and position.x <= 2875:
		cameraVelocity = Vector2(speed, 0)
	if Input.is_action_pressed("move_camera_left") and position.x >= 585:
		speed *= -1
		cameraVelocity = Vector2(speed, 0)
	self.translate(cameraVelocity * delta)
	
	
