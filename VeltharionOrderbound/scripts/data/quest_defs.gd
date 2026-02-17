extends Resource
class_name QuestDefs

static func all() -> Array[Dictionary]:
	return [
		{"id":"prologue_oath", "title":"Enter the Order", "chapter":"Prologue", "goal":1, "reward_sigils":50},
		{"id":"tutorial_trial", "title":"First Trial", "chapter":"Prologue", "goal":3, "reward_sigils":75},
		{"id":"stabilize_rift", "title":"Stabilize the Rift", "chapter":"Act I", "goal":1, "reward_sigils":120},
		{"id":"recover_sigils", "title":"Recover Wild Sigils", "chapter":"Act I", "goal":5, "reward_sigils":100},
		{"id":"unlock_codex", "title":"Codex Initiation", "chapter":"Act I", "goal":1, "reward_sigils":60},
		{"id":"false_records", "title":"False Records", "chapter":"Act II", "goal":3, "reward_sigils":150},
		{"id":"audit_memory", "title":"Audit the Memory Wells", "chapter":"Act II", "goal":2, "reward_sigils":130},
		{"id":"nullcourt_trace", "title":"Trace the Nullcourt", "chapter":"Act II", "goal":1, "reward_sigils":140},
		{"id":"ledger_siege", "title":"Siege of the Ledger", "chapter":"Act III", "goal":1, "reward_sigils":240},
		{"id":"vesper_echo", "title":"Defeat Vesper Echo", "chapter":"Act III", "goal":1, "reward_sigils":300},
		{"id":"season_zero", "title":"Preseason Certified", "chapter":"Epilogue", "goal":3, "reward_sigils":180}
	]
