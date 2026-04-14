extends Area2D
@onready var inventory = get_tree().get_first_node_in_group("inventory")
@onready var inventory_ui = get_tree().get_first_node_in_group("inventory_ui")
var have_bought = false
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var throwing_rock: Sprite2D = $"../Throwing Rock"

func _on_body_entered(body):
		if body.is_in_group("customer"):
			var will_buy = randi_range(0,12)
		
		
			if will_buy == 0:
				inventory.remove_item("Throwing Rock", "Rock", "this is rock", 10, 1)
				have_bought=true
				audio_stream_player_2d.play()
				throwing_rock.show()
				_on_body_entered(body)
				
			elif will_buy == 1:
				inventory.remove_item("Shiny Rock", "Rock", "this is rock", 10, 1)
				have_bought=true
				
				_on_body_entered(body)
				
			elif will_buy == 2:
				inventory.remove_item("Cool Rock", "Rock", "this is rock", 10, 1)
				have_bought=true
				
				_on_body_entered(body)
				
			elif will_buy == 3:
				inventory.remove_item("Berry", "Rock", "this is berry", 10, 1)
				have_bought=true
				
				_on_body_entered(body)
			elif will_buy == 4:
				inventory.remove_item("Log", "Rock", "this is rock", 10, 1)
				have_bought=true
				
				_on_body_entered(body)
				
			elif will_buy == 5:
				inventory.remove_item("Sharp Bone", "Rock", "this is rock", 10, 1)
				have_bought=true
				
				_on_body_entered(body)
				
			elif will_buy == 6:
				inventory.remove_item("Regular Bone", "Rock", "this is berry", 10, 1)
				have_bought=true
				
				_on_body_entered(body)
			elif will_buy == 7:
				inventory.remove_item("Mushroom", "Rock", "this is berry", 10, 1)
				have_bought=true
				
				_on_body_entered(body)
			elif will_buy >= 8 && have_bought == true:
				print("I'm Done")
				return
			elif will_buy >= 8:
				print("Customer: I'm not buying anything!")
			return
	
