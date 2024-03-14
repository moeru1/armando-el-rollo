var cacti_scene: PackedScene = preload("res://Scenes/Objects/Obstacles/cacti.tscn")

func new_random():
	var obj = cacti_scene.instantiate()
	obj.position.x = 19
	return obj
