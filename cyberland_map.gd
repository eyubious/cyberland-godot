extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_task_1_button_pressed():
	get_tree().change_scene_to_file("res://Missions/mission_1/task1.tscn")
