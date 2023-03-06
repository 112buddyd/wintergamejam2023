extends Node

signal player_hold_func
signal player_attack_func
signal player_retreat_func

var player_hold = true
var player_attack = false
var player_retreat = false
var score = 10
var cash = 50
var energy = 50
var unobtainium = 50

func _process(delta):
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
