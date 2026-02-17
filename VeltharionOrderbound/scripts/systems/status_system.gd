extends Node
class_name StatusSystem

var active: Dictionary = {}

func apply_status(target: Node, status: String, duration: float, potency: float) -> void:
	if not active.has(target):
		active[target] = []
	active[target].append({"status":status, "time":duration, "potency":potency})

func tick(target: Node, delta: float) -> void:
	if not active.has(target):
		return
	for effect in active[target]:
		effect["time"] -= delta
		if effect["status"] == "burn" and target.has_method("take_damage"):
			target.take_damage(effect["potency"] * delta, "nature")
	active[target] = active[target].filter(func(e: Dictionary) -> bool: return e["time"] > 0.0)
