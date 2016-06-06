
extends Area2D

var speed = Vector2(0,150)
export var max_speed = Vector2(50,400)
export var min_speed = Vector2(0,10)
var size = Vector2(0,0)
var pos = Vector2(0,0)

func _ready():
	size = get_viewport_rect().size
	init()
	pos.y = (randi()%int(speed.y))*-2
	set_process(true)

func init():
	pos.x = randi()%int(size.x)
	pos.y=0
	#speed.x = randi()%int(max_speed.x)-int(min_speed.x)
	speed.x= randi()%100-50
	speed.y = randi()%int(max_speed.y)+int(min_speed.y)
	set_pos(pos)

func _process(delta):
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

func _on_VisibilityNotifier2D_exit_screen():
	init()
