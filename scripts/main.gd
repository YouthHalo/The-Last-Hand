extends Node2D

@onready var player = $Player
@onready var enemy = $Enemy
@onready var deck = $Player/Deck
var damageToPlayer = 0
var damageToEnemy = 0
var playerTurn = true
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	deck.connect("turnEnd", Callable(self, "_on_player_turn_end"))
	enemy.connect("turnEnd", Callable(self, "_on_enemy_turn_end"))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_player_turn_end() -> void:
	damageToEnemy = player.dealDamage #For some reason this useless lines allow the player to actually deal damage???
	enemy.recieveDamage = player.dealDamage
	player.dealDamage = 0

func _on_enemy_turn_end() -> void:
	damageToPlayer = enemy.dealDamage #unsure whether this line also does the same
	player.recieveDamage = enemy.dealDamage
	enemy.dealDamage = 0
