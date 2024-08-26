extends Node2D

@onready var hp = $UI/Health
@onready var sh = $UI/Shield
@onready var cds = $UI/Cards
var health = 50
var shield = 0.0
var cards = 52
var dealDamage = 0
var stunChance = 0
var bleedChance = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	hp.text = str(health) + " HP"
	sh.text = "+ " + String("%0.1f" % shield) + " Shield HP"
	cds.text = str(cards) + " Cards"
