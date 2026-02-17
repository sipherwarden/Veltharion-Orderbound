extends Resource
class_name ItemDefs

static func starter_loot() -> Array[Dictionary]:
	return [
		{"id":"iron_blade", "name":"Iron Trial Blade", "rarity":"common", "slot":"weapon", "power":4},
		{"id":"order_cape", "name":"Order Cape", "rarity":"uncommon", "slot":"cosmetic", "style":"navy_gold"}
	]
