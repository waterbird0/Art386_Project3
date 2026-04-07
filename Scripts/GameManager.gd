extends Node


var money: int = 0

func add_money(amount: int):
	money += amount
	print("Money:", money)
	


func _ready() -> void:
	print(GameManager.money)
