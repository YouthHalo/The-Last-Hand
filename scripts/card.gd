extends Node2D

var id = "2H"
var inPlace = false
var flipped = false
var hover = false
var selected = false
# Called when the node enters the scene tree for the first time.


func _ready() -> void:
	await get_tree().create_timer(0.1).timeout


func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed and hover:
		if selected:
			selected = false
		else:
			selected = true
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if not inPlace:
		if not flipped:
			scale= scale.lerp(Vector2(0.1, 1), delta*20)
			if scale.x <= 0.15:
				$Sprite2D.texture = load("res://assets/cards/value/" + str(id) + ".png")
				flipped = true
		if flipped and scale.x < 1:
			scale= scale.lerp(Vector2(1.05, 1), delta*20)
		if scale.x > 1: scale.x = 1
		
		position = position.lerp(Vector2(-300, 0), delta * 3)
		if position.x < -299.9:
			position.x = -300
			inPlace = true
	if flipped and scale.x >=1:
		if hover and not selected:
			scale= scale.lerp(Vector2(1.1, 1.1), delta*20)
		elif not hover and not selected:
			scale= scale.lerp(Vector2(1, 1), delta*20)
		if selected:
			scale= scale.lerp(Vector2(1.25, 1.25), delta*20)


func _on_area_2d_mouse_entered() -> void:
	hover = true


func _on_area_2d_mouse_exited() -> void:
	hover = false
