
extends Area2D

export var max_speed = Vector2(50,400)
export var min_speed = Vector2(0,10)
export var max_wait_time = 0.0

var speed = Vector2(0,0)
var size = Vector2(0,0)
var pos = Vector2(0,0)
var wait_time = 1.0
var total_time = 0.0
var state = "waiting"

func _ready():
	size = get_viewport_rect().size
	init()
	set_process(true)

func init():
	state = "running"
	total_time = 0.0
	wait_time = rand_range( 0.0, max_wait_time )
	
	speed.x = rand_range( min_speed.x, max_speed.x )
	speed.y = rand_range( min_speed.y, max_speed.y )

	pos = Vector2(0,0)
	if (size.x > 0):
		pos.x = randi()%int(size.x)
	set_pos(pos)

func _process(delta):
	if (state=="waiting"):
		hide()
		total_time = total_time + delta
		if (total_time > wait_time):
			state="running"
			show()
		return
		
	if (state == "running"):
		translate(Vector2( speed.x * delta , speed.y * delta))

func _on_enemy_area_enter( area ):
	if (area.get_name()=="player"):
		area.exploit()
	
	if (area extends preload("res://player/shot.gd")):
		area.queue_free()
		var level = get_tree().get_root().get_node("level")
		level.get_node("sample").play("exploit_enemy")
		level.inc_pts()
		init()
		state="waiting"

func _on_VisibilityNotifier2D_exit_screen():
	init()
