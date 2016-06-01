
extends Node2D

export var max_enemies = 10

func _ready():
	
	for i in range(max_enemies):
    	build_enemy()
	
func build_enemy():
	var enemy_res = preload("res://enemy/enemy.xml")
	var enemy_scene = enemy_res.instance()
	get_node("enemies").add_child( enemy_scene )
