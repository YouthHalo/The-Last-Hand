extends Node2D

@onready var card = preload("res://scenes/card.tscn").instantiate()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	card.num=11

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		
		add_child(card)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
