extends Node2D

@onready var hp = $UI/Health
@onready var sh = $UI/Shield


var floatUp = true

var health = 50.0
var shield = 0.0
var dealDamage = 0
var stunChance = 0
var bleedChance = 0
var deckArray = [
	"2H", "3H", "4H", "5H", "6H", "7H", "8H", "9H", "TH", "JH", "QH", "KH", "AH",
	"2D", "3D", "4D", "5D", "6D", "7D", "8D", "9D", "TD", "JD", "QD", "KD", "AD",
	"2S", "3S", "4S", "5S", "6S", "7S", "8S", "9S", "TS", "JS", "QS", "KS", "AS",
	"2C", "3C", "4C", "5C", "6C", "7C", "8C", "9C", "TC", "JC", "QC", "KC", "AC"
];
var currentcards = []
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$UI/Cards.hide()
	for i in 3:
		currentcards.append(deckArray[randi_range(0, 51)])
		print(currentcards)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if floatUp:
		position = position.lerp(Vector2(576, 150), delta * 3)
		if position.y < 150.5:
			floatUp = false
	else:
		position = position.lerp(Vector2(576, 200), delta * 3)
		if position.y > 199.5:
			floatUp = true
	hp.text = String("%0.1f" % health) + " HP"
	sh.text = "+ " + String("%0.2f" % shield) + " Shield HP"
