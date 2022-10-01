extends Sprite

func _input(event):
	if event.is_action_pressed("ui_up"):
		if not $RayCast2D_up.is_colliding():
			$"../map".translate(Vector2(0,120))
		checkTile()
	if event.is_action_pressed("ui_down"):
		if not $RayCast2D_down.is_colliding():
			$"../map".translate(Vector2(0,-120))
		checkTile()
	if event.is_action_pressed("ui_left"):
		if not $RayCast2D_left.is_colliding():
			$"../map".translate(Vector2(120,0))
		checkTile()
	if event.is_action_pressed("ui_right"):
		if not $RayCast2D_right.is_colliding():
			$"../map".translate(Vector2(-120,0))
		checkTile()

onready var tentacleMap = self.get_parent().get_node("map/TileMap2")
onready var baseMap = self.get_parent().get_node("map/TileMap")

func checkTile():
	var cell = tentacleMap.world_to_map(tentacleMap.to_local(self.global_position))
	if tentacleMap.get_cellv(cell) != -1:
		var _scene = self.get_tree().change_scene("res://Scenes/Death.tscn")
	if cell == Vector2(2, 22):
		Autoload.victory = "Teleporter"
		var _scene = self.get_tree().change_scene("res://Scenes/Victory.tscn")
