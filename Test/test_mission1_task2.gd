extends "res://addons/gut/test.gd"

#var gameScene = preload("res://Missions/mission_1/mission_1_game/play_game.gd")

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

# func test_point_addition():
	
	
# func test_point_subtraction():
	
	
# func test_answer_item_click():
	
	
# func test_answer_correct():
	
	
# fuct test_answer_incorrect():
	

func test_assert_true_with_true():
	assert_true(true, "Should pass, true is true")

func test_assert_true_with_false():
	assert_true(false, "Should fail")
	
''' 
func test_run():
	# Instantiate the scene
	var button_scene = load("res://start_seq/start_page.tscn").instantiate()
	# Add the instance to the scene
	add_child(button_scene)

	# Connect the signal from the button
	button_scene.connect("_on_button_test_pressed")

	# Simulate button press
	button_scene.get_node("Button").emit_signal("_on_start_btn_pressed")


func _on_button_test_pressed():
	# Assert the expected behavior after the button press
	assert(true, "Button press test passed!")
	#assert_eq(true, "button_scene", "should pass")
	
'''
	
func test_two():
	assert_true(true, "test passed")
	
	
func test_button_navigation():
	# Load the test scene
	var test_scene = load("res://start_seq/start_page.tscn")
	var test_instance = test_scene.instantiate()
	get_node("/root").add_child(test_instance)

	# Wait for one frame to ensure the scene is ready
	# (get_tree(), "idle_frame")
	#await "idle_frame"
	await get_tree().process_frame

	# Access the button node
	var button = test_instance.get_node("startBtn")
	
	print(get_tree().get_current_scene())

	# Simulate button press
	button.set_pressed(true)
	#button.pressed()
	
	#print(button.is_pressed())
	
	#get_tree().change_scene_to_file("res://main_menu.tscn")

	# Replace "expected_scene_path" with the expected scene path after button press
	var expected_scene_path = "res://main_menu.tscn"
	var current_scene_path = get_tree().get_current_scene()
	
	print(current_scene_path)

	# Check if the current scene matches the expected scene
	assert(current_scene_path == expected_scene_path, "Button did not navigate to the correct location")

#func _on_button_test_pressed():
#	# Assert the expected behavior after the button press
#	assert(true, "Button press test passed!")

