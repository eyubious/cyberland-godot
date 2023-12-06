extends Node

# This script is a global script that performs score & reset keeping for res://Missions/mission_1/mission_1_game/play_game.gd

# The number of correct answers the user has chosen
var correct : float = 0.0

# The number of times a user has restarted the game due to incorrect answers
var restarts : int = 0

var mins: int = 0
var secs: int = 0
var msec: int = 0
