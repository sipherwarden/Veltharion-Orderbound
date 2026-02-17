extends Resource
class_name EnemyDefs

static func get_def(enemy_id: String) -> Dictionary:
	var defs := {
		"basic": {"hp": 70.0, "damage": 9.0, "speed": 4.0},
		"elite": {"hp": 180.0, "damage": 16.0, "speed": 3.6},
		"vesper": {"hp": 520.0, "damage": 25.0, "speed": 3.2}
	}
	return defs.get(enemy_id, defs["basic"])
