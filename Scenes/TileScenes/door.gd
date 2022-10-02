extends Node2D


# Declare member variables here. Examples:
# var a = 2
export(int) var id


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func boop():
	print(id)
	return false

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
