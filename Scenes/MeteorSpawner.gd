extends Node2D

var ohno_scene = preload("res://Scenes/ohno.tscn")
const SPAWN_RANGE = 750

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func spawn_ohno(spawn_pos):
	var ohno = ohno_scene.instance()
	var scene_root = get_tree().root.get_children()[0]
	ohno.position = Vector2(spawn_pos.x, spawn_pos.y - SPAWN_RANGE)
	
	scene_root.add_child(ohno);