
extends Node2D
var SPEED = 200
var last_drop_time = 0.0
var max_drop_time = 2.0

func _ready():
	set_process(true)
	
func _process(delta):
	var desp = 0
	if Input.is_action_pressed("ui_left"):
		desp =  delta * -SPEED
	if Input.is_action_pressed("ui_right"):
		desp =  delta * SPEED
	translate(Vector2(desp,0))

	last_drop_time -= delta
	var pos = get_pos()
	
	var drop = Input.is_action_pressed("ui_accept")
	if (drop and last_drop_time<=0):
		var square_res = preload("res://blocks/square.xml")
		var square_scn = square_res.instance()
		pos.x = pos.x + 48
		pos.y = pos.y + 78
		square_scn.set_pos( pos )
		get_parent().add_child( square_scn )
		last_drop_time = max_drop_time 
