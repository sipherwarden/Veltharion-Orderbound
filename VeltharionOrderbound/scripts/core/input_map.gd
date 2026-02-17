extends Node
class_name InputMapLoader

const ACTIONS: Dictionary = {
	"move_forward": [KEY_W],
	"move_back": [KEY_S],
	"move_left": [KEY_A],
	"move_right": [KEY_D],
	"attack_light": [KEY_J],
	"attack_heavy": [KEY_K],
	"dodge": [KEY_SPACE],
	"block": [KEY_SHIFT],
	"ability_1": [KEY_1],
	"ability_2": [KEY_2],
	"ability_3": [KEY_3],
	"cam_left": [KEY_Q],
	"cam_right": [KEY_E],
	"cam_reset": [KEY_R],
	"interact": [KEY_F]
}

func _ready() -> void:
	for action: String in ACTIONS.keys():
		if not InputMap.has_action(action):
			InputMap.add_action(action)
		for keycode: int in ACTIONS[action]:
			var ev := InputEventKey.new()
			ev.physical_keycode = keycode
			InputMap.action_add_event(action, ev)
