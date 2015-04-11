extends VBoxContainer

func _ready():
	for i in range(get_child_count()):
		var item = get_child(i)
		item.get_child(0).connect("pressed", self, "Travel", [item.get_name()])

func Travel(item):
	var game = get_game()
	var trade = get_trade()
	game.set_location(item)
	trade.update_items()

func clear():
	for c in get_children():
		c.free()

func get_game():
	return get_parent().get_parent()

func get_trade():
	return get_parent().get_child(0)