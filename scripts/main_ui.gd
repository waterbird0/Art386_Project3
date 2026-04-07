extends Control

var money = 0
var inventory = []
var max_items = 4

func update_ui():
	$MoneyLabel.text = "Money: " + str(money)

	if inventory.size() == 0:
		$InventoryLabel.text = "Inventory: Empty"
	else:
		$InventoryLabel.text = "Inventory: " + ", ".join(inventory)

func _ready():
	update_ui()
	$MessageLabel.text = "Click a cave to gather an item."

func add_item(item_name):
	if inventory.size() < max_items:
		inventory.append(item_name)
		$MessageLabel.text = "You found a " + item_name + "."
	else:
		$MessageLabel.text = "Inventory Full."

	update_ui()

func _on_cave_button1_pressed():
	add_item("Stone")

func _on_cave_button2_pressed():
	add_item("Bone")

	update_ui()
