extends Node
class_name LootSystem

func grant_starter(profile: Dictionary) -> void:
	for item in ItemDefs.starter_loot():
		profile["inventory"].append(item)

func grant_chest(profile: Dictionary) -> Dictionary:
	var item := {"id":"rift_core", "name":"Rift Core", "rarity":"rare", "slot":"trinket", "power":12}
	profile["inventory"].append(item)
	profile["sigils"] += 90
	return item
