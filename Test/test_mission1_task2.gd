extends "res://addons/gut/test.gd"

var gameScene = load("res://Missions/mission_1/mission_1_game/play_game.tscn")
var gameScript = load("res://Missions/mission_1/mission_1_game/play_game.gd")
var score = load("res://Missions/mission_1/mission_1_game/score.gd")

# Getting necessary data to test
var test_data = {
		"question" : "What is cyberbullying?",
		"image" : "res://Missions/mission_1/mission_1_game/art/1.jpg",
		"answers" : [
			"Harrassment or bullying that occurs through electronic devices",
			"Physical bullying towards the person",
			"Bullying that occurs only verbally"
			],
		"i_correct" : 0
	}
	
var starting_score = {
	correct = 0.0,
	wrong = 0,
	wrong_in_row = 0
}

func before_each():
	gameScene = gameScene.new()
	gameScript = gameScript.new()
	score = score.new()

# func test_point_addition():
	
	
# func test_point_subtraction():
	
	
# func test_answer_item_click():
	
	
# func test_answer_correct():
	
	
# fuct test_answer_incorrect():
	
