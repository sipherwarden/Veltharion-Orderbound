extends Control
class_name HUDController

@onready var hp_bar: ProgressBar = %HPBar
@onready var stamina_bar: ProgressBar = %StaminaBar
@onready var quest_label: Label = %QuestLabel

func update_stats(profile: Dictionary) -> void:
	hp_bar.max_value = profile["max_hp"]
	hp_bar.value = profile["hp"]
	stamina_bar.max_value = profile["max_stamina"]
	stamina_bar.value = profile["stamina"]

func update_quest(text: String) -> void:
	quest_label.text = text
