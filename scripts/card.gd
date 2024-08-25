extends Node2D

var num = 22
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("bruh")
	print(position)
	$Sprite2D.texture = load("res://assets/cards/sprite_"+str(num)+".png")
	#position = get_global_mouse_position()
	position = Vector2(-100, 0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
