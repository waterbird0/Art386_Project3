extends Node

var items = []

func _ready():
	add_to_group("inventory")

func add_item(item_name, item_type, value, amount):
	for item in items:
		if item["name"] == item_name:
			item["amount"] += amount
			print("UPDATED: ", item_name, " x", item["amount"])
			print_inventory()
			return

	var new_item = {
		"name": item_name,
		"type": item_type,
		"value": value,
		"amount": amount
	}

	items.append(new_item)
	print("ADDED: ", item_name, " x", amount)
	print_inventory()

func print_inventory():
	print("---- INVENTORY ----")
	for item in items:
		print(item["name"], " | type: ", item["type"], " | amount: ", item["amount"])
	print("-------------------")
