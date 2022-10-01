extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():

	
	$place_walls.plase_walls($"../../../TileMap".get_used_cells_by_id(1))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var pos = $"../../..".global_transform.origin
	pos = Vector3((pos[0]-700)/120 - 0.5 , 0, (pos[1]-420)/120 - 0.5)
	$"../..".global_transform.origin = Vector2(700,420)
	$CSGCombiner.global_transform.origin = pos
