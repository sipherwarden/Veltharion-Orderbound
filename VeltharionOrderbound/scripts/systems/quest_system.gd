extends Node
class_name QuestSystem

var quests: Dictionary = {}

func bootstrap(profile: Dictionary) -> void:
	for q in QuestDefs.all():
		if not profile["quests"].has(q["id"]):
			profile["quests"][q["id"]] = {"progress":0, "goal":q["goal"], "completed":false}
	quests = profile["quests"]

func advance(profile: Dictionary, quest_id: String, amount: int = 1) -> void:
	if not quests.has(quest_id):
		return
	var q: Dictionary = quests[quest_id]
	if q["completed"]:
		return
	q["progress"] = min(q["progress"] + amount, q["goal"])
	if q["progress"] >= q["goal"]:
		q["completed"] = true
		for def in QuestDefs.all():
			if def["id"] == quest_id:
				profile["sigils"] += def["reward_sigils"]
	EventBus.quest_updated.emit(quest_id, q)
