extends Node


var money: int = 20

func add_money(amount: int):
	money += amount
	print("$", money)
	


func _ready() -> void:
	print(GameManager.money)
