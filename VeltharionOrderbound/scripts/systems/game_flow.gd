extends Node
class_name GameFlow

@onready var quest_system: QuestSystem = $QuestSystem
@onready var loot_system: LootSystem = $LootSystem
@onready var economy: EconomySystem = $EconomySystem
@onready var ranked: RankedSystem = $RankedSystem
@onready var leaderboards: LeaderboardSystem = $LeaderboardSystem

func _ready() -> void:
	quest_system.bootstrap(SaveSystem.profile)
	if SaveSystem.profile["inventory"].is_empty():
		loot_system.grant_starter(SaveSystem.profile)
	leaderboards.refresh(SaveSystem.profile)

func complete_tutorial() -> void:
	quest_system.advance(SaveSystem.profile, "tutorial_trial", 3)
	SaveSystem.profile["flags"]["tutorial_complete"] = true
	economy.gain_xp(SaveSystem.profile, 125)
	SaveSystem.save_all()

func clear_dungeon() -> void:
	var reward := loot_system.grant_chest(SaveSystem.profile)
	quest_system.advance(SaveSystem.profile, "stabilize_rift", 1)
	economy.gain_xp(SaveSystem.profile, 220)
	print("Dungeon reward: ", reward)
	SaveSystem.save_all()

func run_ranked_trial(won: bool, bot_rating: int = 1020) -> Dictionary:
	var result := ranked.run_trial(SaveSystem.profile, bot_rating, won)
	SaveSystem.add_ledger_entry({"mode":"ranked_trial", "bot_rating":bot_rating, "won":won, "result":result})
	leaderboards.refresh(SaveSystem.profile)
	return result
