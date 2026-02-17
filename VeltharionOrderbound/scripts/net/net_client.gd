extends Node
class_name NetClient

var http := HTTPRequest.new()

func _ready() -> void:
	add_child(http)

func submit_match(payload: Dictionary, token: String) -> void:
	var signed := payload.duplicate(true)
	signed["signature"] = NetProtocol.sign_payload(payload, token)
	http.request(Config.SERVER_URL + "/match", ["Content-Type: application/json"], HTTPClient.METHOD_POST, JSON.stringify(signed))
