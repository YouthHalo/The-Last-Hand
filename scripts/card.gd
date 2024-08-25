extends Node2D

var id = "2H"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_tree().create_timer(0.1).timeout
	$Sprite2D.texture = load("res://assets/cards/value/" + str(id) + ".png")
	print(id)
	print(position)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x -= 1
	if(position.x < -300):
		queue_free()
