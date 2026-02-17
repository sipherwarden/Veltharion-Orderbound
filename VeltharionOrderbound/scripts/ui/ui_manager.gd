extends CanvasLayer
class_name UIManager

@onready var hud: Control = $HUD
@onready var menus: Control = $Menus

func show_hud() -> void:
	hud.visible = true
	menus.visible = false

func show_menu() -> void:
	hud.visible = false
	menus.visible = true
