
extends Node2D

export var max_enemies = 1
export var max_time = 30.0

var pts = 0
var total_time = 0.0

func _ready():
	set_process(true)
	show_pts()
	for i in range(max_enemies):
    	build_enemy()
	
func build_enemy():
	var enemy_res = preload("res://enemy/enemy.xml")
	var enemy_scene = enemy_res.instance()
	get_node("enemies").add_child( enemy_scene )

func show_pts():
	get_node("text/points").set_text( str(pts) )
	
func inc_pts():
	pts = pts + 10
	show_pts()

func _process(delta):
	total_time = total_time + delta
	if (total_time > max_time):
		total_time = 0
		build_enemy()
		
