extends Node2D

@onready var player = $Player
@onready var enemy = $Enemy
var damageToPlayer = 0
var damageToEnemy = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	damageToPlayer = enemy.dealDamage
	damageToEnemy = player.dealDamage
	enemy.recieveDamage = player.dealDamage
