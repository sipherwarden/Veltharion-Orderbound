extends RefCounted
class_name PlayerProfile

static func create_default() -> Dictionary:
	return {
		"version": Constants.SAVE_VERSION,
		"name": "Initiate",
		"house": "",
		"lineage": "",
		"level": 1,
		"xp": 0,
		"sigils": 0,
		"hp": 100.0,
		"max_hp": 100.0,
		"stamina": 100.0,
		"max_stamina": 100.0,
		"abilities": {},
		"inventory": [],
		"equipment": {},
		"ranked": {"elo": Constants.BASE_ELO, "wins": 0, "losses": 0, "streak": 0},
		"quests": {},
		"flags": {"tutorial_complete": false}
	}
