
extends Node2D

export var max_enemies = 10
export var pts = 0

func _ready():
	show_pts()
	for i in range(max_enemies):
    	build_enemy()
	
func build_enemy():
	var enemy_res = preload("res://enemy/enemy.xml")
	var enemy_scene = enemy_res.instance()
	get_node("enemies").add_child( enemy_scene )

func show_pts():
	get_node("panel/pts").set_text( str(pts) )
	
func inc_pts():
	pts = pts + 10
	show_pts()