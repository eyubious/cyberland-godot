extends Node2D

@onready var message = $endDescription


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	display_score()
	
func display_score():
	var score # = round(correct / dict.size() * 100)
	var response
	if score >= 21:
		response = "You answered all the questions correctly. Congratulations!"
	elif score <= 20 and score >= 18:
		response = "Congratulations, you missed a few questions, but you've learned many new things!"
	else:
		response = "It looks like you have some shortcomings. The good news is that you've learned a lot. Continue to learn!"


func _on_next_btn_pressed():
	get_tree().change_scene_to_file("res://Missions/mission_1/mission1_activity/task3.tscn")
