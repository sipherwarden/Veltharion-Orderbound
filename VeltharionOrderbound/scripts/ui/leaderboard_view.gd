extends Control
class_name LeaderboardView

@onready var output: RichTextLabel = %BoardText

func render_board(data: Dictionary) -> void:
	output.clear()
	for row in data["top_elo"]:
		output.append_text("%s | ELO %d | Wins %d | Lvl %d\n" % [row["name"], row["elo"], row["wins"], row["level"]])
