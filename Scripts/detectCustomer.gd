extends Area2D
@onready var inventory = get_tree().get_first_node_in_group("inventory")
@onready var inventory_ui = get_tree().get_first_node_in_group("inventory_ui")
var have_bought = false
func _on_body_entered(body):
		if body.is_in_group("customer"):
			var will_buy = randi_range(0,7)
		
		
			if will_buy == 0:
				inventory.remove_item("Throwing Rock", "Rock", "this is rock", 10, 1)
				have_bought=true
				_on_body_entered(body)
				have_bought=true
			elif will_buy == 1:
				inventory.remove_item("Shiny Rock", "Rock", "this is rock", 10, 1)
				have_bought=true
				_on_body_entered(body)
				have_bought=true
			elif will_buy == 2:
				inventory.remove_item("Cool Rock", "Rock", "this is rock", 10, 1)
				have_bought=true
				_on_body_entered(body)
				have_bought=true
			elif will_buy == 3:
				inventory.remove_item("Berry", "Rock", "this is berry", 10, 1)
				have_bought=true
				_on_body_entered(body)
				
			elif will_buy >= 4 && have_bought == true:
				print("I'm Done")
				return
			elif will_buy >= 4:
				print("Customer: I'm not buying anything!")
			return
	
