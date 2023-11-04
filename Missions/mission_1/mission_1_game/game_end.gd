extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_next_btn_pressed():
	get_tree().change_scene_to_file("res://Missions/mission_1/mission1_activity/task3.tscn")
