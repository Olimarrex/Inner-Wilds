extends Node2D

func _ready():
	Autoload.doors.clear();
	renderPhase(0);

func renderPhase(phase):
	if(phaseObjectMaps[phase]):
		place_tiles(phaseObjectMaps[phase], $ObjectMap);
		place_scenes(phaseObjectMaps[phase].get_used_cells_by_id(6), teleporter)
		place_scenes(phaseObjectMaps[phase].get_used_cells_by_id(7), tentacles)
		#place_door(phaseObjectMaps[phase].get_used_cells_by_id(8), door)
	
	if(phaseTileMaps[phase]):
		place_tiles(phaseTileMaps[phase], $TileMap);

onready var phaseObjectMaps = [
	$ObjectMap,
	$Phase2ObjectMap,
	false
]

onready var phaseTileMaps = [
	false,
	$Phase2TileMap,
	false,
]

onready var teleporter = preload("res://Scenes/TileScenes/Teleporter.tscn")
onready var tentacles = preload("res://Scenes/TileScenes/Tentacle.tscn")
onready var door = preload("res://Scenes/TileScenes/door.tscn")

func place_tiles(tileMap, targetMap):
	var XYs = tileMap.get_used_cells()
	var a = [];
	for i in XYs:
		var index = tileMap.get_cell(i.x, i.y);
		targetMap.set_cell(i.x, i.y, index);
		if index == 1 && targetMap == $TileMap:
			a.append(i)
	$"3d_shit/Viewport/3d_test".place_walls(a);

func place_scenes(XYs, instance):
	var j = 0;
	for i in XYs:
		var temp = instance.instance()
		temp.transform.origin = (i * Vector2(12, 12)) + Vector2(6, 6);
		$ObjectMap.add_child(temp)
		if instance == door:
			temp.name = "door" + str(j) 
			j += 1
			Autoload.doors.append(temp)


func place_door(XYs, instance):
	var j = 0;
	for i in XYs:
		var temp = instance.instance()
		temp.transform.origin = Vector3(i[0]+1, 0, i[1]+1)
		$"3d_shit/Viewport/3d_test/CSGCombiner".add_child(temp)
		if instance == door:
			temp.name = "door" + str(j) 
			print (temp.name)
			j += 1
			Autoload.doors.append(temp)
