extends StaticBody2D

@export var level := 1
@export var health := 500
@export var baseGeneration = 6

const COST = 40

var timer = 0;

var parent_building = null
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timer += delta
	if timer >= 3:
		timer = 0
		PlayerData.energy += (level * baseGeneration)
	
func take_hit(damage: int):
	health -= damage
	if health < 1:
		destroy()
		
func destroy() -> void:
	parent_building.unhide_building()
	queue_free()
