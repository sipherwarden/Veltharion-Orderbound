extends Node
class_name EventBus

signal profile_loaded(profile: Dictionary)
signal profile_saved(profile: Dictionary)
signal quest_updated(quest_id: String, state: Dictionary)
signal combat_hit(attacker: Node, target: Node, amount: float, damage_type: String)
signal elo_updated(new_elo: int, division: String)
signal leaderboard_updated(data: Dictionary)
signal npc_interacted(npc_id: String)
