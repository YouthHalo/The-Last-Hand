extends Node2D 

@onready var card = preload("res://scenes/card.tscn")
@onready var player = $".."

var currentCard = -1
var hover = false
var canClick = true
var deckArray = [
	"2H", "3H", "4H", "5H", "6H", "7H", "8H", "9H", "TH", "JH", "QH", "KH", "AH",
	"2D", "3D", "4D", "5D", "6D", "7D", "8D", "9D", "TD", "JD", "QD", "KD", "AD",
	"2S", "3S", "4S", "5S", "6S", "7S", "8S", "9S", "TS", "JS", "QS", "KS", "AS",
	"2C", "3C", "4C", "5C", "6C", "7C", "8C", "9C", "TC", "JC", "QC", "KC", "AC"
];


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_tree().create_timer(0.1).timeout
	create_card()


func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed and hover and canClick:
		pass

func create_card() -> void:
	var cardInstance= card.instantiate()
	currentCard = randi_range(0, 51)
	cardInstance.id = deckArray[currentCard]
	add_child(cardInstance)
	use_card()
	
func use_card() -> void:
	var value = 0
	if deckArray[currentCard][0] == "T":
		value = 10
	elif deckArray[currentCard][0] == "J":
		value = 11
	elif deckArray[currentCard][0] == "Q":
		value = 12
	elif deckArray[currentCard][0] == "K":
		value = 13
	elif deckArray[currentCard][0] == "A":
		value = 15
	else:
		value = int(deckArray[currentCard][0])
	
	if deckArray[currentCard][1] == "H":
		player.health += value
	elif deckArray[currentCard][1] == "D":
		player.shield += (value/2)
	elif deckArray[currentCard][1] == "S":
		player.dealDamage = value*2
		player.bleedChance = value*4
	elif deckArray[currentCard][1] == "C":
		player.dealDamage = value
		player.stunChance = value*5
	
	print("HP - " + str(player.health))
	print("Shield - " + String("%0.1f" % player.shield)) #floats dont print normally
	print("DMG - " + str(player.dealDamage))
	print("Bleed - " + str(player.bleedChance))
	print("Stun - " + str(player.stunChance))

func card_value(card: String) -> int:
	var rank = card[0]
	var suit = card[1]
	
	# Define the order for ranks
	var rank_order = {"2": 0, "3": 1, "4": 2, "5": 3, "6": 4, "7": 5, "8": 6, "9": 7, "T": 8, "J": 9, "Q": 10, "K": 11, "A": 12}
	# Define the order for suits (Hearts, Diamonds, Spades, Clubs)
	var suit_order = {"H": 0, "D": 1, "S": 2, "C": 3}
	
	return rank_order[rank] + suit_order[suit] * 13


func custom_sort(a: String, b: String) -> bool:
	return card_value(a) < card_value(b)
##to sort, run
#deckArray.sort_custom(self, "custom_sort")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_mouse_entered() -> void:
	hover = true

func _on_area_2d_mouse_exited() -> void:
	hover = false
