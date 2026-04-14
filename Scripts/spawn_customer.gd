extends Node2D

@onready var customer_scene = preload("res://scenes/customer.tscn")
@onready var customer_container = get_parent().get_node("Customer Temp") # a Node2D to hold all customers
var customer_count = randi() % 10 + 10
var customers_today = 0
func _ready() -> void:
	$Timer.one_shot = true
	start_timer_random()
	
func start_timer_random():
	$Timer.wait_time = randf_range(5, 10)
	$Timer.start()
	
func _on_timer_timeout() -> void:
	print("Customers coming today: " + str(customer_count))
	print("Customers that have come today: " + str(customers_today))
	if customers_today < customer_count:
		var cus = customer_scene.instantiate()  
		cus.position = position                
		customer_container.add_child(cus)
		cus.get_node("AnimationPlayer").play("progress")
		customers_today += 1
		start_timer_random()
	else:
		$Timer.stop()
	
