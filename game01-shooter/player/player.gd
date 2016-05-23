
extends Area2D

const SPEED = 200
var exploted = false

func _ready():
	# Called every time the node is added to the scene.
	# Initialization her
	set_process(true)

func _process(delta):
	var dir=Vector2()
	
	if (Input.is_action_pressed("player_down")):
		dir+=Vector2(0,1)
	if (Input.is_action_pressed("player_up")):
		dir+=Vector2(0,-1)
	if (Input.is_action_pressed("player_left")):
		dir+=Vector2(-1,0)
	if (Input.is_action_pressed("player_right")):
		dir+=Vector2(1,0)
	
	var pos = get_pos()
	pos+=dir * delta * SPEED
	var size = get_viewport_rect().size
	
	pos.x = clamp(pos.x, 0, size.x)
	pos.y = clamp(pos.y, 0, size.y)
	
	set_pos(pos)

func exploit():
	if (exploted):
		return
	get_node("sprite").hide()
	get_node("explosion").set_emitting(true)
	exploted=true