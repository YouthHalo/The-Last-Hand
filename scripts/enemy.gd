extends Node2D

@onready var hp = $UI/Health
@onready var sh = $UI/Shield
@onready var game = $".."

var floatUp = true

var health = 50.0
var shield = 0.0
var dealDamage = 0
var stunChance = 0
var bleedChance = 0
var recieveDamage = 0
var deckArray = [
	"2H", "3H", "4H", "5H", "6H", "7H", "8H", "9H", "TH", "JH", "QH", "KH", "AH",
	"2D", "3D", "4D", "5D", "6D", "7D", "8D", "9D", "TD", "JD", "QD", "KD", "AD",
	"2S", "3S", "4S", "5S", "6S", "7S", "8S", "9S", "TS", "JS", "QS", "KS", "AS",
	"2C", "3C", "4C", "5C", "6C", "7C", "8C", "9C", "TC", "JC", "QC", "KC", "AC"
];
var currentcards = []
var playerTurn = true
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$UI/Cards.hide()
	for i in 3:
		currentcards.append(deckArray[randi_range(0, 51)])
		print(currentcards)

func use_card() -> void:
	stunChance = 0
	bleedChance = 0
	dealDamage = 0
	var value = 0
	if currentcards[0][0] == "T":
		value = 10
	elif currentcards[0][0] == "J":
		value = 11
	elif currentcards[0][0] == "Q":
		value = 12
	elif currentcards[0][0] == "K":
		value = 13
	elif currentcards[0][0] == "A":
		value = 15
	else:
		value = int(currentcards[0][0])
	
	if currentcards[0][1] == "H":
		health += value
	elif currentcards[0][1] == "D":
		shield += float(value) / 2.0
	elif currentcards[0][1] == "S":
		dealDamage = value*2
		bleedChance = value*4
	elif currentcards[0][1] == "C":
		dealDamage = value
		stunChance = value*5
	
	currentcards.remove_at(0)
	currentcards.append(deckArray[randi_range(0, 51)])

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	recieveDamage = game.damageToEnemy
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
	if recieveDamage > 0:
		if shield > 0:
			if recieveDamage > 4*shield:
				shield = 0
				health -= (recieveDamage - 4*shield)
			else:
				shield -= recieveDamage
				if shield < 0:
					shield = 0
		else:
			health -= recieveDamage
			game.damageToEnemy = 0
			recieveDamage = 0
