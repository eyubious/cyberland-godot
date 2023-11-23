extends Node2D

# timer variable
var time: float =  300.0

# score variables
var wrong: int = 0
var wrong_in_row: int = 0

# load data to dictionary
var dict = read_file("res://Missions/mission_1/mission_1_game/question_content.json")
var item: Dictionary
var item_index: int = 0

# question & answers variables
@onready var displayQuestion = $VBoxContainer/question
@onready var displayAnswerChoices = $VBoxContainer/answerChoices
@onready var message = $message
@onready var healthBar = $VBoxContainer/progressBar

# Called when the node enters the scene tree for the first time.
func _ready():
	Score.correct = 0
	time = 300.0
	Score.mins = 0
	Score.secs = 0
	Score.msec = 0
	refresh_screen()
	
func refresh_screen():
	if item_index >= dict.size():
		show_results()
	else:
		show_question()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time -= delta
	Score.msec = fmod(time, 1) * 100
	Score.secs = fmod(time, 60)
	Score.mins = fmod(time, 3600) / 60
	$VBoxContainer/timer/mins.text = "%02d:" % Score.mins
	$VBoxContainer/timer/secs.text = "%02d." % Score.secs
	$VBoxContainer/timer/msec.text = "%02d" % Score.msec
	
	if (Score.mins == 0 && Score.secs == 0 && Score.msec == 0):
		stop()
		
func stop() -> void:
	set_process(false)
	
func format_time() -> String:
	return "%02d:%02d.%02d" % [Score.mins, Score.secs, Score.msec]
	
func show_question():
	displayQuestion.show()
	displayAnswerChoices.show()
	displayAnswerChoices.clear()
	item = dict[item_index]
	displayQuestion.text = item.question
	var answers = item.answers
	for answer in answers:
		displayAnswerChoices.add_item(answer)

func show_results():
	get_tree().change_scene_to_file("res://Missions/mission_1/mission_1_game/game_end.tscn")
	
func read_file(file):
	var json_as_text = FileAccess.get_file_as_string(file)
	var json_as_dict = JSON.parse_string(json_as_text)
	return json_as_dict
	
func _on_answer_choices_item_selected(index):
	if index == item.i_correct:
		Score.correct += 1
		wrong_in_row = 0
	elif wrong_in_row >= 2:
		Score.restarts += 1
		get_tree().reload_current_scene()
	elif wrong >= 5:
		Score.restarts += 1
		get_tree().reload_current_scene()
	else:
		wrong_in_row += 1
		wrong += 1
	healthBar.value = Score.correct / dict.size() * 100
	item_index += 1
	refresh_screen()
