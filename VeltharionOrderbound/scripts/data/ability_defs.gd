extends Resource
class_name AbilityDefs

static func get_defs() -> Dictionary:
	return {
		"dawn_warden": {
			"ability_1": {"name":"Radiant Strike", "cooldown": 4.0, "damage": 18.0, "scale":"physical*0.8+arcane*0.2"},
			"ability_2": {"name":"Sanctify", "cooldown": 10.0, "damage": 0.0, "shield": 25.0},
			"ability_3": {"name":"Aurora Aegis", "cooldown": 28.0, "damage": 32.0, "status":"weaken"}
		},
		"trail_warden": {
			"ability_1": {"name":"Pathbreaker", "cooldown": 5.0, "damage": 20.0, "status":"slow"},
			"ability_2": {"name":"Surveyor Mark", "cooldown": 12.0, "damage": 12.0, "status":"weaken"},
			"ability_3": {"name":"Wayfinder Rush", "cooldown": 26.0, "damage": 36.0, "status":"stun"}
		},
		"steel_trial": {
			"ability_1": {"name":"Pressure Lunge", "cooldown": 4.0, "damage": 22.0, "status":"bleed"},
			"ability_2": {"name":"Guard Break", "cooldown": 9.0, "damage": 16.0, "status":"stun"},
			"ability_3": {"name":"Verdict Chain", "cooldown": 24.0, "damage": 44.0, "status":"weaken"}
		},
		"arc_trial": {
			"ability_1": {"name":"Arc Sigil", "cooldown": 5.0, "damage": 24.0, "damage_type":"arcane"},
			"ability_2": {"name":"Trial Node", "cooldown": 11.0, "damage": 14.0, "status":"slow"},
			"ability_3": {"name":"Jury Storm", "cooldown": 25.0, "damage": 40.0, "damage_type":"storm"}
		},
		"citadel_weaver": {
			"ability_1": {"name":"Bulwark Totem", "cooldown": 6.0, "damage": 10.0, "shield": 18.0},
			"ability_2": {"name":"Aegis Lattice", "cooldown": 13.0, "damage": 0.0, "status":"slow"},
			"ability_3": {"name":"Citadel Bloom", "cooldown": 30.0, "damage": 30.0, "status":"weaken"}
		},
		"glyph_weaver": {
			"ability_1": {"name":"Glyph Dart", "cooldown": 3.0, "damage": 20.0, "damage_type":"nature"},
			"ability_2": {"name":"Sigil Snare", "cooldown": 10.0, "damage": 12.0, "status":"stun"},
			"ability_3": {"name":"Archive Burst", "cooldown": 27.0, "damage": 42.0, "damage_type":"shadow"}
		}
	}
