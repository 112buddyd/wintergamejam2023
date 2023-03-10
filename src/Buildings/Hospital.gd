extends StaticBody2D
@export var level := 1
@export var health := 500.0
@export var baseGen := 10
var parent_building = null
const COST = 50
var timer = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timer += delta
	if timer >= (30):
		PlayerData.score += baseGen
		timer = 0
	get_node("ProgressBar").set_value(health/500)
	
	

func take_hit(damage: int):
	health -= damage
	if health < 1:
		destroy()
		

func destroy() -> void:
	parent_building.unhide_building()
	queue_free()
	

