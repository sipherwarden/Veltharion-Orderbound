extends Node
class_name RankedSystem

@export var k_factor: int = Constants.DEFAULT_K_FACTOR

func run_trial(profile: Dictionary, bot_rating: int, won: bool) -> Dictionary:
	var old_elo: int = profile["ranked"]["elo"]
	var expected := 1.0 / (1.0 + pow(10.0, float(bot_rating - old_elo) / Constants.ELO_SCALE))
	var score := 1.0 if won else 0.0
	var delta: int = int(round(k_factor * (score - expected)))
	profile["ranked"]["elo"] = max(900, old_elo + delta)
	if won:
		profile["ranked"]["wins"] += 1
		profile["ranked"]["streak"] = max(1, int(profile["ranked"]["streak"]) + 1)
	else:
		profile["ranked"]["losses"] += 1
		profile["ranked"]["streak"] = min(-1, int(profile["ranked"]["streak"]) - 1)
	var division := get_division(profile["ranked"]["elo"])
	EventBus.elo_updated.emit(profile["ranked"]["elo"], division)
	return {"old_elo":old_elo, "new_elo":profile["ranked"]["elo"], "delta":delta, "division":division}

func get_division(elo: int) -> String:
	for d in Constants.DIVISIONS:
		if elo >= d["min"] and elo <= d["max"]:
			return d["name"]
	return "Unranked"
