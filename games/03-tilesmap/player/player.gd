
extends RigidBody2D

var speed = 100

func _ready():
	set_mode(2)
	set_fixed_process(true)
	
func _fixed_process(delta):
	if Input.is_key_pressed(16777217) or Input.is_key_pressed(81):
		get_tree().quit()

	var dir = Vector2(0,0)
	
	if Input.is_action_pressed("player_left"):
		dir.x = dir.x - speed * delta
	if Input.is_action_pressed("player_right"):
		dir.x = dir.x + speed * delta
	if Input.is_action_pressed("player_up"):
		dir.y = dir.y - speed * delta
	if Input.is_action_pressed("player_down"):
		dir.y = dir.y + speed * delta

	translate(dir)

