extends Area2D

@export var item_name := "Coin"

var player_in_range := false

func _ready():
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

func _process(delta):
	if player_in_range and Input.is_action_just_pressed("interact"):
		pick_up()

func _on_body_entered(body):
	if body.is_in_group("player"):
		player_in_range = true

func _on_body_exited(body):
	if body.is_in_group("player"):
		player_in_range = false

func pick_up():
	print("Recogido: ", item_name)
	queue_free()
