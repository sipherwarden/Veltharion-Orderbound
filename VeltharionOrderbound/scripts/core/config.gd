extends Node
class_name Config

const ONLINE_LADDER: bool = false
const SERVER_URL: String = "http://127.0.0.1:8000"
const SAVE_PATH: String = "user://profile.json"
const LEDGER_PATH: String = "user://ledger.json"
const TARGET_FPS: int = 60

func _ready() -> void:
	Engine.max_fps = TARGET_FPS
