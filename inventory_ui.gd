extends CanvasLayer

var is_open := false

@onready var panel = $Panel
@onready var label = $Panel/Label
@onready var inventory = get_tree().get_first_node_in_group("inventory")

func _ready():
	panel.visible = false

func _process(_delta):
	if Input.is_action_just_pressed("Inventory"):
		toggle_inventory()

func toggle_inventory():
	is_open = !is_open
	panel.visible = is_open
	
	if is_open:
		update_inventory_display()

func update_inventory_display():
	if inventory == null:
		label.text = "Inventory not found."
		return
	
	var text = "INVENTORY\n\n"
	
	if inventory.items.size() == 0:
		text += "Empty"
	else:
		for item in inventory.items:
			text += item["name"] + " x" + str(item["amount"]) + "\n"
	
	label.text = text
