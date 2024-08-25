extends Node2D

@onready var card = preload("res://scenes/card.tscn")

var currentcard = -1
var deckArray = [
	"2H", "3H", "4H", "5H", "6H", "7H", "8H", "9H", "TH", "JH", "QH", "KH", "AH",
	"2D", "3D", "4D", "5D", "6D", "7D", "8D", "9D", "TD", "JD", "QD", "KD", "AD",
	"2S", "3S", "4S", "5S", "6S", "7S", "8S", "9S", "TS", "JS", "QS", "KS", "AS",
	"2C", "3C", "4C", "5C", "6C", "7C", "8C", "9C", "TC", "JC", "QC", "KC", "AC"
];
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		var cardInstance= card.instantiate()
		currentcard += 1
		cardInstance.num = currentcard
		add_child(cardInstance)
		print(deckArray.size())

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
