extends TileMap


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var teleporter = preload("res://Scenes/TileScenes/Teleporter.tscn")
onready var tentacles = preload("res://Scenes/TileScenes/Tentacle.tscn")
onready var door = preload("res://Scenes/TileScenes/door.tscn")

var instance
# Called when the node enters the scene tree for the first time.
func _ready():
	place_scenes(get_used_cells_by_id(6), teleporter)
	place_scenes(get_used_cells_by_id(7), tentacles)
	place_scenes(get_used_cells_by_id(8), door)


func place_scenes(XYs, instance):
	var j = 0
	for i in XYs:
		var temp = instance.instance()
		temp.transform.origin = (i * Vector2(12, 12)) + Vector2(6, 6);
		$".".add_child(temp)
		if instance == door:
			temp.name = "door" + str(j) 
			j += 1
			Autoload.doors.append(temp)
