extends StaticBody2D
@export var level := 1
@export var health := 500
@export var baseIncome := 6
var parentBuilding = null
const COST = 45
var timer = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timer += delta
	if timer >= (3):
		PlayerData.money += baseIncome
		timer = 0
	
func take_hit(damage: int):
	health -= damage
	if health < 1:
		destroy()
		
func destroy() -> void:
	parentBuilding.un_hide()
	queue_free()
