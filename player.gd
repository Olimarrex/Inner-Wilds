extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _input(event):
	if event.is_action_pressed("ui_up"):
		if not $RayCast2D_up.is_colliding():
			$"../map".translate(Vector2(0,120))
	if event.is_action_pressed("ui_down"):
		if not $RayCast2D_down.is_colliding():
			$"../map".translate(Vector2(0,-120))
	if event.is_action_pressed("ui_left"):
		if not $RayCast2D_left.is_colliding():
			$"../map".translate(Vector2(120,0))
	if event.is_action_pressed("ui_right"):
		if not $RayCast2D_right.is_colliding():
			$"../map".translate(Vector2(-120,0))
