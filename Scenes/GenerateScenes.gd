extends TileMap


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var teleporter = preload("res://Scenes/TileScenes/Teleporter.tscn")

var instance
# Called when the node enters the scene tree for the first time.
func _ready():
	var cells = get_used_cells_by_id(6);
	for cell in cells:
		var pos = (cell * Vector2(12, 12)) + Vector2(6, 6);
		instance = teleporter.instance();
		print(pos)
		instance.transform.origin = pos;
		$".".add_child(instance);
		
#func plase_walls(XYs):
##print(XYs)
#	for i in XYs:
#	#		print(Vector3(i[0], 1, i[1]))
#		var temp = wall.instance()
#		temp.global_transform.origin = Vector3(i[0]+1, 1, i[1]+1)
#		$"../CSGCombiner".add_child(temp)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print(instance.global_transform.origin)
