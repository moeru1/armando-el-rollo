extends Node

func _ready():
	if !FileAccess.file_exists("user://savedata.tres"):
		save_data()

func save_data():
	var saved_data: SavedData = SavedData.new()
	saved_data.high_score = GlobalValues.top_distance_traveled
	ResourceSaver.save(saved_data, "user://savedata.tres")

func load_data():
	var saved_data: SavedData = load("user://savedata.tres") as SavedData
	GlobalValues.top_distance_traveled = saved_data.high_score

