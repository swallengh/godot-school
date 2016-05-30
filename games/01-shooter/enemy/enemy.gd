
extends Area2D

func _ready():
	pass

func _on_enemy_area_enter( area ):
	if (area.get_name()=="player"):
		area.exploit()
	
	if (area extends preload("res://player/shot.gd")):
		area.kill_enemy()
		get_tree().get_root().get_node("level1/sample").play("exploit_enemy")
		get_tree().get_root().get_node("level1/player").enemy_killed()
		queue_free()