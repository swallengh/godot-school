
extends Node2D

export var speed = Vector2(9000,0)
var state="stand"
var dir="left"
var anim_name= state+"_"+dir
var feet = null

func _ready():
	feet = get_node("feet")
	get_node("anim").play(anim_name)
	set_process(true)
	set_mode(2)

func _process(delta):
	var s = state+"_"+dir
	if s!=anim_name:
		anim_name=s
		get_node("anim").play(anim_name)

	state="stand"
	
	if feet.is_colliding():
		if Input.is_action_pressed("player_left"):
			set_axis_velocity(Vector2(-speed.x*delta,0))
			state="move"
			dir="left"
		if Input.is_action_pressed("player_right"):
			set_axis_velocity(Vector2(speed.x*delta,0))
			state="move"
			dir="right"
	
	print("feet",feet.is_colliding())
	
func _on_VisibilityNotifier2D_exit_screen():
	get_tree().quit()
