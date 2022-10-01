extends Sprite

const dist = 120;

func _input(event):
	if event.is_action_pressed("ui_up"):
		tryMoveTo(Vector2(0, dist), $RayCast2D_up);
	if event.is_action_pressed("ui_down"):
		tryMoveTo(Vector2(0, -dist), $RayCast2D_down);
	if event.is_action_pressed("ui_left"):
		tryMoveTo(Vector2(dist, 0), $RayCast2D_left);
	if event.is_action_pressed("ui_right"):
		tryMoveTo(Vector2(-dist, 0), $RayCast2D_right);
	

onready var tentacleMap = self.get_parent().get_node("map/ObjectMap")

func tryMoveTo(pos, rayCast2D):
	checkTile(self.global_position - pos)
	if not rayCast2D.is_colliding():
		$"../map".translate(pos)

func checkTile(pos):
	var cell = tentacleMap.world_to_map(tentacleMap.to_local(pos))
	var cellv = tentacleMap.get_cellv(cell);
	if cellv >= 0 and cellv <= 4:
		var _scene = self.get_tree().change_scene("res://Scenes/you_dead.tscn")
	elif cellv == 5:
		print('NOTE')
