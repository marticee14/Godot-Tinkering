extends Node

var player_faction: FactionData = preload(
	"res://resources/factions/blue.tres"
)

func select_faction(faction: FactionData) -> void:
	player_faction = faction

func _on_red_button_pressed() -> void:
	GameManager.select_faction(
		preload("res://resources/factions/red.tres")
	)
