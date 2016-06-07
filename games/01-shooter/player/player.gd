
extends Area2D

const SPEED = 200
var exploted = false
var prev_shoot = false
var total_time = 0

func _ready():
	set_process(true)

func _process(delta):
	if exploted:
		total_time = total_time + delta
		#The player is dead and we are waiting a few seconds before quit
		if (total_time > 3):
			get_tree().quit()
		return

	var dir=Vector2()
	if (Input.is_action_pressed("player_down")): #Move player down
		dir+=Vector2(0,1)
	if (Input.is_action_pressed("player_up")): #Move player up
		dir+=Vector2(0,-1)
	if (Input.is_action_pressed("player_left")): #Move player left
		dir+=Vector2(-1,0)
	if (Input.is_action_pressed("player_right")): #Move player right
		dir+=Vector2(1,0)
	
	var pos = get_pos()
	pos+=dir * delta * SPEED #This is our new position
	
	var size = get_viewport_rect().size
	pos.x = clamp(pos.x, 0, size.x) #The player can't exit screen
	pos.y = clamp(pos.y, 0, size.y)
	set_pos(pos) #set our new position, move the player
	
	var shoot = Input.is_action_pressed("player_shot")
	if (shoot and not prev_shoot):
		var shot_res = preload("res://player/shot.xml")
		var shot_scn = shot_res.instance()
		pos.y = pos.y - 32
		shot_scn.set_pos( pos )
		get_parent().add_child( shot_scn )
	prev_shoot = shoot

func exploit():
	if (exploted): #The player can't be exploted now
		return
	get_node("sprite").hide() #Hide the image
	get_node("explosion").set_emitting(true) #Active explosion effect
	get_node("sample").play("explosion") #Play the explosion sound
	exploted=true #Now player is in exploted state, bye bye
	