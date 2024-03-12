extends Node

#Loading Paths
var loading_screen_path: String = "res://LoadingScreens/loading_screen.tscn"
var loss_screen_path: String = "res://LoadingScreens/loss_screen.tscn"
var menu_screen_path: String = "res://LoadingScreens/menu.tscn"
var menu_music_path: String = "res://Assets/Audio/Soundtrack/Armando_Titlescreen_ost.ogg"
var gameplay_music_path: String = "res://Assets/Audio/Soundtrack/Armando_Gameplay_ost.ogg"
var gameover_music_path: String = "res://Assets/Audio/Soundtrack/Armando_Gameover_ost.ogg"
#Game related values
var high_score: int = 0

var speed_modif: float = 1.0

