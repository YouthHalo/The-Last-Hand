extends Node2D

@onready var player = $Player
@onready var enemy = $Enemy
var damageToPlayer = 0
var damageToEnemy = 0
var playerTurn = true
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

	if playerTurn and player.playerTurn:
		damageToEnemy = player.dealDamage #For some reason this useless lines allow the player to actually deal damage???
		enemy.recieveDamage = player.dealDamage
		player.dealDamage = 0
	elif not playerTurn and not enemy.playerTurn:
		damageToPlayer = enemy.dealDamage #unsure whether this line also does the same
		player.recieveDamage = enemy.dealDamage
		enemy.dealDamage = 0
