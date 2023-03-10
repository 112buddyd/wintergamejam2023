extends StaticBody2D
@export var level := 1
@export var health := 500.0
@export var baseGen := 5
var parent_building = null
const COST = 45
var timer = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timer += delta
	if timer >= (60):
		PlayerData.score += baseGen
		timer = 0
	
func take_hit(damage: int):
	health -= damage
	if health < 1:
		destroy()
		
func destroy() -> void:
	parent_building.unhide_building()
	queue_free()
