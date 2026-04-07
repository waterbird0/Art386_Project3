extends Area2D

func _on_body_entered(body):
	if body.is_in_group("customer"):
		GameManager.add_money(10)
		print(GameManager.money)
