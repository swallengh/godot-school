
extends Node2D

var player = null
var ray = null
var speed = Vector2(8000,9000)
var state="stand"
var dir="left"
var anim_name= state+"_"+dir

func _ready():
	player = get_node("player")
	ray = get_node("player/ray")
	#ray.add_exception(player)
	get_node("player/anim").play(anim_name)
	set_process(true)
	
func _process(delta):
	if Input.is_key_pressed(81):
		get_tree().quit()
		
	var s = state+"_"+dir
	if s!=anim_name:
		if state=="jump":
			state="move"
		anim_name=state+"_"+dir
		get_node("player/anim").play(anim_name)

	if on_ground():
		if Input.is_action_pressed("player_jump"):
			player.set_axis_velocity(Vector2(0, -speed.y*delta))
			state="jump"
		elif Input.is_action_pressed("player_left"):
			player.set_axis_velocity(Vector2(-speed.x*delta,0))
			state="move"
			dir="left"
		elif Input.is_action_pressed("player_right"):
			player.set_axis_velocity(Vector2(speed.x*delta,0))
			state="move"
			dir="right"
		else:
			state="stand"
	else:
		state="jump"
		
	print("state => ",state,", dir =>",dir)
			
func _on_VisibilityNotifier2D_exit_screen():
	get_tree().quit()

func on_ground():
	return ray.is_colliding()
	
