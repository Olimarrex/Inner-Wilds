extends Node


var wall = preload("res://Scenes/test shit/wall.tscn")

func plase_walls(XYs):
	#print(XYs)
	for i in XYs:
#		print(Vector3(i[0], 1, i[1]))
		var temp = wall.instance()
		temp.global_transform.origin = Vector3(i[0]+1, 1, i[1]+1)
		$"../CSGCombiner".add_child(temp)
