extends Node2D

@onready var customer_scene = preload("res://customer.tscn")
@onready var customer_container = get_parent().get_node("Customer Temp") # a Node2D to hold all customers
func _ready() -> void:
	$Timer.one_shot = true
	start_timer_random()
	
func start_timer_random():
	$Timer.wait_time = randf_range(3, 6)
	$Timer.start()
	
func _on_timer_timeout() -> void:
	var cus = customer_scene.instantiate()  
	cus.position = position                
	customer_container.add_child(cus)
	cus.get_node("AnimationPlayer").play("progress")
	
	start_timer_random()
