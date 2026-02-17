extends Control
class_name CodexView

@onready var lore: RichTextLabel = %LoreText

func _ready() -> void:
	lore.text = "The Oath is Binding\nThe Trial is Proof\nThe Record is Law"
