extends Area2D

@export var health := 5000 

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
	
func take_hit(damage: int):
	health -= damage
	print(str(health))
	if health < 1:
		city_destroy()


func city_destroy() -> void:
	queue_free()
