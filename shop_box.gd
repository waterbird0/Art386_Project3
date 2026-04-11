extends Area2D

@export var item_scene: PackedScene

@export var spawned_item_name := "Rock"
@export var spawned_item_type := "decoration"
@export var spawned_item_value := 10
@export var spawned_item_amount := 1
@export var spawned_item_price := 5
@export var spawned_item_texture: Texture2D
@export var spawned_item_scale: Vector2 = Vector2(1, 1)

func _ready():
	input_pickable = true

func _input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		open_box()

func open_box():
	if item_scene:
		var spawn_pos = global_position
		
		var item = item_scene.instantiate()
		
		item.item_name = spawned_item_name
		item.item_type = spawned_item_type
		item.value = spawned_item_value
		item.amount = spawned_item_amount
		item.price = spawned_item_price
		item.item_texture = spawned_item_texture
		item.item_scale = spawned_item_scale
		
		get_parent().add_child(item)
		item.global_position = spawn_pos
		item.setup_item()
	
	queue_free()
