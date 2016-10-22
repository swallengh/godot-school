
extends Node2D
var SPEED = 200

func _ready():
	set_process(true)
	
func _process(delta):
	var desp = 0
	if Input.is_action_pressed("ui_left"):
		desp =  delta * -SPEED
	if Input.is_action_pressed("ui_right"):
		desp =  delta * SPEED
	translate(Vector2(desp,0))
