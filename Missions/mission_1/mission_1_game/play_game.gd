extends Node2D

# timer variables
var time: float =  300.0
var mins: int = 0
var secs: int = 0
var msec: int = 0

# load data to dictionary
var dict = read_file("res://Missions/mission_1/mission_1_game/question_content.json")
var item: Dictionary
var item_index: int = 0

# question & answers variables
@onready var displayQuestion = $VBoxContainer/question
@onready var displayAnswerChoices = $VBoxContainer/answerChoices
var correct: float = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	refresh_screen()
	
	
func refresh_screen():
	if item_index >= dict.size():
		show_results()
	else:
		show_question()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time -= delta
	msec = fmod(time, 1) * 100
	secs = fmod(time, 60)
	mins = fmod(time, 3600) / 60
	$VBoxContainer/timer/mins.text = "%02d:" % mins
	$VBoxContainer/timer/secs.text = "%02d." % secs
	$VBoxContainer/timer/msec.text = "%03d" % msec
	
	if (mins == 0 && secs == 0 && msec == 0):
		stop()
		
func stop() -> void:
	set_process(false)
	
func format_time() -> String:
	return "%02d:%02d.%03d" % [mins, secs, msec]
	
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
	get_tree().change_scene_to_file("res://Missions/mission_1/mission1_game/game_end.tscn")
	
	
func read_file(file):
	var json_as_text = FileAccess.get_file_as_string(file)
	var json_as_dict = JSON.parse_string(json_as_text)
	return json_as_dict
	


func _on_answer_choices_item_selected(index):
	if index == item.i_correct:
		correct += 1
	item_index += 1
	refresh_screen()
