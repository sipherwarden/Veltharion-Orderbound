extends RefCounted
class_name NetProtocol

static func sign_payload(payload: Dictionary, token: String) -> String:
	return (JSON.stringify(payload) + token).sha256_text()
