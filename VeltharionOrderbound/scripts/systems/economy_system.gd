extends Node
class_name EconomySystem

func gain_xp(profile: Dictionary, amount: int) -> void:
	profile["xp"] += amount
	while profile["level"] < 50 and profile["xp"] >= _xp_for(profile["level"]):
		profile["xp"] -= _xp_for(profile["level"])
		profile["level"] += 1
		profile["max_hp"] += 6.0
		profile["max_stamina"] += 4.0

func _xp_for(level: int) -> int:
	return 100 + (level * 25)
