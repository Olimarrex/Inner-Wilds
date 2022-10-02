extends Sprite

const dist = 120;
var interaction = false
var combinationCount
var combination = []
var playerComb = []
var codeContainer

func _input(event):
	if interaction == false:
		if event.is_action_pressed("ui_up"):
			tryMoveTo(Vector2(0, dist), $RayCast2D_up);
		if event.is_action_pressed("ui_down"):
			tryMoveTo(Vector2(0, -dist), $RayCast2D_down);
		if event.is_action_pressed("ui_left"):
			tryMoveTo(Vector2(dist, 0), $RayCast2D_left);
		if event.is_action_pressed("ui_right"):
			tryMoveTo(Vector2(-dist, 0), $RayCast2D_right);
	elif interaction == true:
		if codeContainer.get_child_count() < combinationCount:
			if event.is_action_pressed("ui_up"):
				var newRect = TextureRect.new()
				codeContainer.add_child(newRect)
				newRect.texture = load("res://Art/UI/InteractionUI/upArrow.png")
				playerComb.append("Up")
			if event.is_action_pressed("ui_down"):
				var newRect = TextureRect.new()
				codeContainer.add_child(newRect)
				newRect.texture = load("res://Art/UI/InteractionUI/downArrow.png")
				playerComb.append("Down")
			if event.is_action_pressed("ui_left"):
				var newRect = TextureRect.new()
				codeContainer.add_child(newRect)
				newRect.texture = load("res://Art/UI/InteractionUI/leftArrow.png")
				playerComb.append("Left")
			if event.is_action_pressed("ui_right"):
				var newRect = TextureRect.new()
				codeContainer.add_child(newRect)
				newRect.texture = load("res://Art/UI/InteractionUI/rightArrow.png")
				playerComb.append("Right")
			checkComb()

func checkComb():
	if codeContainer.get_child_count() == combinationCount:
		if playerComb == combination:
			#insert correct noise.
			self.get_parent().get_node("doorInteraction").queue_free()
			interaction = false
		else:
			#insert sound buzzer wrong.
			self.get_parent().get_node("doorInteraction/AnimationPlayer").play("boxfade")
			yield(self.get_parent().get_node("doorInteraction/AnimationPlayer"), "animation_finished")
			for i in codeContainer.get_children():
				i.queue_free()
			playerComb.clear()
			codeContainer.modulate = Color8(255, 255, 255, 255)

onready var tentacleMap = self.get_parent().get_node("map/ObjectMap")
onready var baseMap = self.get_parent().get_node("map/TileMap")

func tryMoveTo(pos, rayCast2D):
	checkTile(self.global_position - pos)
	if not rayCast2D.is_colliding():
		$"../map".translate(pos)

func checkTile(pos):
	var cell = tentacleMap.world_to_map(tentacleMap.to_local(pos))
	var cellv = tentacleMap.get_cellv(cell);
	if cellv == 5:
		print('NOTE')
	elif cellv == 6:
		Autoload.victory = "Teleporter"
		var _scene = self.get_tree().change_scene("res://Scenes/Victory.tscn")
	elif cellv == 7:
		var _scene = self.get_tree().change_scene("res://Scenes/Death.tscn")
	elif cellv == 8:
		for i in Autoload.doors:
			if tentacleMap.to_local(pos) == tentacleMap.to_local(i.global_position):
				combination = Autoload.doorInteractionsDic[i.name]
				combinationCount = Autoload.doorInteractionsDic[i.name].size()
				print(combinationCount)
				print(combination)
		interaction = true
		var interactionNode = preload("res://Scenes/Instances/doorInteraction.tscn").instance()
		self.get_parent().add_child(interactionNode)
		codeContainer = self.get_parent().get_node("doorInteraction/CenterContainer/TextureRect/CenterContainer/HBoxContainer")
