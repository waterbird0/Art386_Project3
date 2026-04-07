extends Area2D

@export var item_name := "Rock"
@export var item_type := "decoration"
@export var value := 10
@export var amount := 1

var player_in_range := false

func _ready():
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

func _process(_delta):
	if player_in_range and Input.is_action_just_pressed("interact"):
		pick_up()

func _on_body_entered(body):
	if body.is_in_group("player"):
		player_in_range = true

func _on_body_exited(body):
	if body.is_in_group("player"):
		player_in_range = false

func pick_up():
	var inventory = get_tree().get_first_node_in_group("inventory")
	if inventory:
		inventory.add_item(item_name, item_type, value, amount)
		queue_free()
