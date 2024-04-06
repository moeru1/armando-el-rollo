extends Node

#Sound values
var music_volume: int = 100

#Loading Paths
var loading_screen_path: String = "res://LoadingScreens/loading_screen.tscn"
var loss_screen_path: String = "res://LoadingScreens/loss_screen.tscn"
var menu_screen_path: String = "res://LoadingScreens/menu.tscn"

#Game related values
var top_distance_traveled: int = 0
var distance_traveled: int = 0

var high_score: int = 0
var score: int = 0

var speed_modif: float = 1.0

