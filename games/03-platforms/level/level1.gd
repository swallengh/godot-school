
extends Node2D

var player = null
var ray = null
var speed = Vector2(120,500)
var state="stand"
var dir="left"
var anim_name= state+"_"+dir
var wait = true

func _ready():
	player = get_node("player")
	ray = get_node("player/ray")
	ray.add_exception(player)
	get_node("player/anim").play(anim_name)
	set_process(true)
	
func _process(delta):
	if Input.is_key_pressed(16777217) or Input.is_key_pressed(81):
		get_tree().quit()
		
	if ray.is_colliding():
		if Input.is_action_pressed("player_jump"):
			player.set_axis_velocity(Vector2(0, -speed.y))
			state="jump"
		else:
			state="stand"
	
	if Input.is_action_pressed("player_left"):
		player.set_axis_velocity(Vector2(-speed.x,0))
		state="move"
		dir="left"
	elif Input.is_action_pressed("player_right"):
		player.set_axis_velocity(Vector2(speed.x,0))
		state="move"
		dir="right"
	
	var s = state+"_"+dir
	if s!=anim_name:
		anim_name=s
		get_node("player/anim").play(anim_name)
		
	print("state => ",state,", dir =>",dir)
			
func _on_VisibilityNotifier2D_exit_screen():
	get_tree().quit()
	
