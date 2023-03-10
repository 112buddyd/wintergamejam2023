extends StaticBody2D

@export var health := 5000.0
var max_health = health

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_node("ProgressBar").set_value(health/5000)
	if max_health > health:
		health += delta
	
	
func take_hit(damage: int):
	health -= damage
	if health < 1:
		city_destroy()


func city_destroy() -> void:
	queue_free()
	get_tree().change_scene_to_file("res://src/Scenes/end_screen.tscn")
