
extends Area2D

func _ready():
	pass

func _on_enemy_area_enter( area ):
	if (area.get_name()=="player"):
		area.exploit()
	
	if (area extends preload("res://enemy/enemy.scn")):
		queue_free()