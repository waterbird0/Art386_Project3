extends Area2D

@export var item_name := "Rock"
@export var item_type := "decoration"
@export var value := 10
@export var amount := 1
@export var price := 5
@export var item_texture: Texture2D
@export var item_scale: Vector2 = Vector2(1, 1)

func _ready():
	input_pickable = true

func setup_item():
	if item_texture:
		$Sprite2D.texture = item_texture
	
	$Sprite2D.scale = item_scale

func _input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		buy_item()

func buy_item():
	var inventory = get_tree().get_first_node_in_group("inventory")

	if inventory:
		if inventory.has_method("spend_money"):
			if inventory.spend_money(price):
				inventory.add_item(item_name, item_type, value, amount)
				print("Bought: ", item_name)
				queue_free()
			else:
				print("Not enough money")
		else:
			inventory.add_item(item_name, item_type, value, amount)
			print("Added (no money system): ", item_name)
			queue_free()
