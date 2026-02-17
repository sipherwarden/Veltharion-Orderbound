extends Node
class_name SaveSystem

var profile: Dictionary = {}
var ledger: Array[Dictionary] = []

func _ready() -> void:
	load_all()

func load_all() -> void:
	profile = _load_profile()
	ledger = _load_ledger()
	EventBus.profile_loaded.emit(profile)

func save_all() -> void:
	_write_json(Config.SAVE_PATH, profile)
	_write_json(Config.LEDGER_PATH, {"entries": ledger})
	EventBus.profile_saved.emit(profile)

func add_ledger_entry(entry: Dictionary) -> void:
	entry["id"] = str(Time.get_unix_time_from_system()) + "-" + str(ledger.size())
	entry["timestamp"] = Time.get_datetime_string_from_system()
	ledger.append(entry.duplicate(true))
	save_all()

func _load_profile() -> Dictionary:
	if not FileAccess.file_exists(Config.SAVE_PATH):
		return PlayerProfile.create_default()
	var data: Variant = _read_json(Config.SAVE_PATH)
	if typeof(data) != TYPE_DICTIONARY:
		return PlayerProfile.create_default()
	return _migrate_profile(data)

func _load_ledger() -> Array[Dictionary]:
	if not FileAccess.file_exists(Config.LEDGER_PATH):
		return []
	var data: Variant = _read_json(Config.LEDGER_PATH)
	if typeof(data) == TYPE_DICTIONARY and data.has("entries"):
		return data["entries"]
	return []

func _migrate_profile(old: Dictionary) -> Dictionary:
	var merged := PlayerProfile.create_default()
	for k in old.keys():
		merged[k] = old[k]
	merged["version"] = Constants.SAVE_VERSION
	return merged

func _read_json(path: String) -> Variant:
	var f := FileAccess.open(path, FileAccess.READ)
	if f == null:
		return null
	var parsed := JSON.parse_string(f.get_as_text())
	return parsed

func _write_json(path: String, value: Variant) -> void:
	var f := FileAccess.open(path, FileAccess.WRITE)
	if f == null:
		return
	f.store_string(JSON.stringify(value, "\t"))
