extends Control
class_name CharacterCreateView

signal selected(house: String, lineage: String)

func choose(house: String, lineage: String) -> void:
	selected.emit(house, lineage)
