extends Node2D

@onready var message = $VBoxContainer/endDescription
@onready var numCorrect = $VBoxContainer/HBoxContainer/numCorrect
@onready var numTime = $VBoxContainer/HBoxContainer/numTime
@onready var numRestarts = $VBoxContainer/HBoxContainer/numRestarts


# Called when the node enters the scene tree for the first time.
func _ready():
	Score.correct
	Score.mins
	Score.secs
	Score.msec
	display_score()
	display_stats()
	
	
func display_score():
	if Score.correct >= 21:
		message.text = "You answered all the questions correctly. Congratulations!"
	elif Score.correct <= 20 and Score.correct >= 18:
		message.text = "Congratulations, you missed a few questions, but you've learned many new things!"
	else:
		message.text = "It looks like you have some shortcomings. The good news is that you've learned a lot. Continue to learn!"
	message.show()
	
func display_stats():
	numCorrect.text = str(round(Score.correct/21 * 100))
	numTime.text = "%02d:%02d.%03d" % [Score.mins, Score.secs, Score.msec]
	numRestarts.text = str(Score.restarts)
	numCorrect.show()
	numTime.show()
	numRestarts.show()

func _on_next_btn_pressed():
	get_tree().change_scene_to_file("res://Missions/mission_1/mission1_activity/task3.tscn")
