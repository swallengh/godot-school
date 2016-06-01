
extends Area2D

export var speed = Vector2(0,150)
export var max_speed = Vector2(0,400)
export var min_speed = Vector2(0,10)
var size = null
var pos =null

func init():
	pos = get_pos()
	pos.x = randi()%int(size.x)
	pos.y=0
	speed.x = randi()%200-100
	speed.y = randi()%int(max_speed.y)+int(min_speed.y)
	set_pos(pos)

func _ready():
	size = get_viewport_rect().size
	init()
	pos.y = (randi()%int(speed.y))*-1
	set_process(true)

func _process(delta):
	translate(Vector2( speed.x * delta , speed.y * delta))

func _on_enemy_area_enter( area ):
	if (area.get_name()=="player"):
		area.exploit()
	
	if (area extends preload("res://player/shot.gd")):
		area.queue_free()
		get_tree().get_root().get_node("level1/sample").play("exploit_enemy")
		queue_free()

func _on_VisibilityNotifier2D_exit_screen():
	init()
