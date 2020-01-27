extends Node2D

# Declare member variables here. Examples:
var lazer_scene = preload("res://Scenes/shots_fired.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func shoot():
	var shot = lazer_scene.instance()
	var scene_root = get_tree().root.get_children()[0]
	shot.position = Vector2(self.position.x-10, self.position.y - 70)
	
	scene_root.add_child(shot);