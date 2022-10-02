extends Node

var victory = ""
var doorInteractionsDic = {}
var doors = []

func _ready():
	doorInteractionsJSON()

func doorInteractionsJSON():
	var doorInteractionsFile = File.new()
	doorInteractionsFile.open("res://Data/doorInteractions.json", File.READ)
	var doorInteractionsJSON = JSON.parse(doorInteractionsFile.get_as_text())
	doorInteractionsFile.close()
	doorInteractionsDic = doorInteractionsJSON.result
