extends Node

var items = []
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $"../AudioStreamPlayer2D"


func _ready():
	add_to_group("inventory")
	add_item("Throwing Rock", "decoration", 10, 0)
	add_item("Shiny Rock", "decoration", 10, 0)
	add_item("Cool Rock", "decoration", 10, 0)
	add_item("Sharp Bone", "decoration", 10, 0)
	add_item("Regular Bone", "decoration", 10, 0)
	add_item("Mushroom", "decoration", 10, 0)
	add_item("Log", "decoration", 10, 0)
	add_item("Berry", "decoration",  10, 0)

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



func remove_item(item_name, item_type, description, value, amount):
	for item in items:
		if item["name"] == item_name:
			if item["amount"] >= amount:
				GameManager.add_money(10)
				item["amount"] -= amount
				print("UPDATED: ", item_name, " x", item["amount"])
				audio_stream_player_2d.play()
				print_inventory()
				return
			else:
				print("sorry we're out of that item " + item["name"])
				return
	print("dont know that item")
