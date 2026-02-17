extends Node
class_name LeaderboardSystem

var rows: Array[Dictionary] = []

func refresh(profile: Dictionary) -> Dictionary:
	rows = [{
		"name": profile["name"],
		"elo": profile["ranked"]["elo"],
		"wins": profile["ranked"]["wins"],
		"level": profile["level"]
	}]
	var data := {
		"top_elo": rows.duplicate(),
		"most_wins": rows.duplicate(),
		"highest_level": rows.duplicate()
	}
	EventBus.leaderboard_updated.emit(data)
	return data
