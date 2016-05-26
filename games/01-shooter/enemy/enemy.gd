
extends Area2D

func _ready():
	pass

func _on_enemy_area_enter( area ):
	if (area.get_name()=="player"):
		area.exploit()
	
	if (area extends preload("res://player/shot.gd")):
		get_node("sample").play("explosion")
		queue_free()