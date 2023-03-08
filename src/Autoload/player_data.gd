extends Node

signal player_hold_func
signal player_attack_func
signal player_retreat_func

var player_hold = true
var player_attack = false
var player_retreat = false
var queue_repeat = false
var score = 10
var money = 50
var energy = 10
var timer = 0.0

var selectedBuilding = null

func _process(delta):
	timer += delta
	if Input.is_action_just_pressed("go"):
		player_hold = false
		player_attack = true
		player_retreat = false
	if Input.is_action_just_pressed("retreat"):
		player_hold = false
		player_attack = false
		player_retreat = true
	if Input.is_action_just_pressed("hold"):
		player_hold = true
		player_attack = false
		player_retreat = false
	if Input.is_action_just_pressed("repeat"):
		if queue_repeat:
			queue_repeat = false
		else:
			queue_repeat = true
	if timer >= 8:
		score += 3
		money += 3
		energy += 3
		timer = 0
