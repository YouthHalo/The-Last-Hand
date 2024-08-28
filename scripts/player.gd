extends Node2D

@onready var hp = $UI/Health
@onready var sh = $UI/Shield
@onready var cds = $UI/Cards
@onready var game = $".."
var health = 50.0
var shield = 0.0
var cards = 52
var dealDamage = 0
var stunChance = 0
var bleedChance = 0
var recieveDamage = 0
var playerTurn = true
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	
	hp.text = String("%0.1f" % health) + " HP"
	sh.text = "+ " + String("%0.2f" % shield) + " Shield HP"
	cds.text = str(cards) + " Cards"
	if recieveDamage > 0:
		if shield > 0:
			if recieveDamage > (4 * shield):
				health -= recieveDamage - (4*shield)
				shield = 0
			else:
				shield -= recieveDamage
				if shield < 0:
					shield = 0
		else:
			health -= recieveDamage
			game.damageToPlayer = 0
			recieveDamage = 0
