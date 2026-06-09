extends Control

# Drag the Player node into this slot in the Inspector.
@export var player_path: NodePath

@onready var log_label: Label = $InventoryPanel/LogLabel
@onready var player: Node = get_node(player_path)

func _ready() -> void:
	# Show the starting inventory.
	update_log_count(0)

	# Listen for inventory changes from the player.
	if player != null and player.has_signal("inventory_changed"):
		player.inventory_changed.connect(_on_inventory_changed)

func _on_inventory_changed(item_name: String, new_total: int) -> void:
	if item_name == "Log" or item_name == "Oak Log":
		update_log_count(new_total)

func update_log_count(total: int) -> void:
	log_label.text = "Logs: " + str(total)
