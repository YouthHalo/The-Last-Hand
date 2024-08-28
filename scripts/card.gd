extends Node2D

@onready var summoner = $".."

var id = "2H"
var inPlace = false
var flipped = false
var hover = false
var selected = false
var returning = false
var lastCard = false
# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	$use.hide()
	$return.hide()
	await get_tree().create_timer(0.1).timeout
	summoner.connect("turnEnd", Callable(self, "_on_turn_end"))


func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed and hover and str(summoner) == "Deck:<Node2D#30551311626>":
		if selected:
			selected = false
		else:
			selected = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if not inPlace and not returning:
		if not flipped:
			scale= scale.lerp(Vector2(0.1, 1), delta*20)
			if scale.x <= 0.13:
				$Sprite2D.texture = load("res://assets/cards/value/" + str(id) + ".png")
				flipped = true
		if flipped and scale.x < 1:
			scale= scale.lerp(Vector2(1, 1), delta*20)
		if str(summoner) == "Deck:<Node2D#30551311626>":
			position = position.lerp(Vector2(-900, 0), delta * 3)
		else:
			position = position.lerp(Vector2(-300, 0), delta * 3)

		if str(summoner) == "Deck:<Node2D#30551311626>":
			if position.x < -899.9:
				position.x = -900
				inPlace = true
		else:
			if position.x < -299.9:
				position.x = -300
				inPlace = true
			
	if flipped and not returning:
		if selected:
			scale= scale.lerp(Vector2(1.25, 1.25), delta*20)
			$use.show()
			if not lastCard:
				$return.show()
		else:
			$use.hide()
			$return.hide()
			if hover:
				scale= scale.lerp(Vector2(1.1, 1.1), delta*20)
			else:
				scale= scale.lerp(Vector2(1, 1), delta*20)
	
	if returning:

		if not inPlace:
			if not flipped:
				scale= scale.lerp(Vector2(0.1, 1), delta*20)
				if scale.x <= 0.13:
					$Sprite2D.texture = load("res://assets/cards/back/sprite_57.png")
					flipped = true
			if flipped and scale.x < 1:
				scale= scale.lerp(Vector2(1, 1), delta*20)
			position = position.lerp(Vector2(20, 0), delta * 3)
		if position.x > -0.1:
			position.x = 0
			flipped = false
			queue_free()

func _on_area_2d_mouse_entered() -> void:
	if str(summoner) == "Deck:<Node2D#30551311626>":
		hover = true


func _on_area_2d_mouse_exited() -> void:
	if str(summoner) == "Deck:<Node2D#30551311626>":
		hover = false


func _on_use_pressed() -> void:
	$Sprite2D.hide()
	selected = false
	$use.hide()
	$return.hide()
	if id[1] == "H" or id[1] == "D":
		$redExplosion.emitting = true
	else:
		$blackExplosion.emitting = true
	await get_tree().create_timer(0.5).timeout
	queue_free()

func _on_return_pressed() -> void:
	flipped = false
	selected = false
	inPlace = false
	$use.hide()
	$return.hide()
	returning = true
	
func _on_turn_end() -> void:
	if str(summoner) != "Deck:<Node2D#30551311626>":
		_on_use_pressed()
		#Lets the enemy always use the card, and prevents return button from blowing it up
