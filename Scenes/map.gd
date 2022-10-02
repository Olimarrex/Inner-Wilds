extends Node2D

func _ready():
	Autoload.doors.clear();
	renderPhase(0);

func renderPhase(phase):
	place_scenes(phaseMaps[phase].get_used_cells_by_id(6), teleporter)
	place_scenes(phaseMaps[phase].get_used_cells_by_id(7), tentacles)
	place_scenes(phaseMaps[phase].get_used_cells_by_id(8), door)	

onready var phaseMaps = [
	$ObjectMap,
	$Phase2Map
]

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var teleporter = preload("res://Scenes/TileScenes/Teleporter.tscn")
onready var tentacles = preload("res://Scenes/TileScenes/Tentacle.tscn")
onready var door = preload("res://Scenes/TileScenes/door.tscn")


func place_scenes(XYs, instance):
	var j = 0;
	for i in XYs:
		var temp = instance.instance()
		temp.transform.origin = (i * Vector2(12, 12)) + Vector2(6, 6);
		$ObjectMap.add_child(temp)
		if instance == door:
			temp.name = "door" + str(j) 
			print (temp.name)
			j += 1
			Autoload.doors.append(temp)
