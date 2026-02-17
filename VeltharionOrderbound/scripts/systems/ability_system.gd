extends Node
class_name AbilitySystem

var cooldowns: Dictionary = {}

func can_cast(ability_id: String) -> bool:
	return cooldowns.get(ability_id, 0.0) <= 0.0

func trigger(ability_id: String, cooldown: float) -> void:
	cooldowns[ability_id] = cooldown

func tick(delta: float) -> void:
	for key: String in cooldowns.keys():
		cooldowns[key] = max(cooldowns[key] - delta, 0.0)
