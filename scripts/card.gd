extends Node2D

var num = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if num < 10:
		$Sprite2D.texture = load("res://assets/cards/value/sprite_0" + str(num) + ".png")
	else:
		$Sprite2D.texture = load("res://assets/cards/value/sprite_" + str(num) + ".png")
	print(num)
	position = Vector2(-100-num*2, 0)
	print(position)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x -= 1
	if(position.x < -300):
		queue_free()
