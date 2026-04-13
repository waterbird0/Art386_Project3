extends Control

var money = 0
var held_item = ""

func update_ui():
	$MoneyLabel.text = "Money: " + str(money)

	if held_item == "":
		$ItemLabel.text = "Item: None"
	else:
		$ItemLabel.text = "Item: " + held_item

func _ready():
	update_ui()
	$MessageLabel.text = "Click a cave to gather an item."

func _on_cave_button1_pressed():
	if held_item == "":
		held_item = "Stone"
		$MessageLabel.text = "You found a Stone."
	else:
		$MessageLabel.text = "You can only carry one item."
	update_ui()

func _on_cave_button2_pressed():
	if held_item == "":
		held_item = "Bone"
		$MessageLabel.text = "You found a Bone."
	else:
		$MessageLabel.text = "You can only carry one item."
	update_ui()

func _on_sell_button_pressed():
	if held_item != "":
		money += 10
		$MessageLabel.text = "Sold " + held_item + " for 10 coins."
		held_item = ""
	else:
		$MessageLabel.text = "You have nothing to sell."
	update_ui()
