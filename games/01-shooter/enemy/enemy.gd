
extends Area2D

func _ready():
	set_process(true)

func _process(delta):
	pass
	
func _on_enemy_area_enter( area ):
	if (area.get_name()=="player"):
		area.exploit()
	
	if (area extends preload("res://player/shot.gd")):
		area.queue_free()
		get_tree().get_root().get_node("level1/sample").play("exploit_enemy")
		queue_free()