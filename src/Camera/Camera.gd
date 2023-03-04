extends Node2D
#-----------------Vars---------------
var lastMousePos = Vector2();
var isMouseDragging = false;




#-----------------Functions---------------

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#Key camera movement.
	var cameraVelocity = Vector2()
	var speed = 1000
	cameraVelocity = Vector2()
	if Input.is_action_pressed("move_camera_right")and position.x <= 2875:
		cameraVelocity = Vector2(speed, 0)
	if Input.is_action_pressed("move_camera_left") and position.x >= 585:
		speed *= -1
		cameraVelocity = Vector2(speed, 0)
	self.translate(cameraVelocity * delta)
	
	

func _input(event):
	#Mouse camera movement.
	if event.is_action_pressed("move_camera_with_mouse"):
		isMouseDragging = true
	elif event.is_action_released("move_camera_with_mouse"):
		isMouseDragging = false
	if isMouseDragging and position.x <= 2875 and position.x >= 570:
		var deltaCam = get_global_mouse_position() - lastMousePos
		var newCamX = clamp(position.x - deltaCam.x, 585, 2875)
		position.x = newCamX;
	lastMousePos = get_global_mouse_position()
	
	
