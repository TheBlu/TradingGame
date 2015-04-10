extends VBoxContainer

func _ready():
	for i in range(get_child_count()):
		var item = get_child(i)
		item.get_child(0).connect("pressed", self, "Travel", [item.get_name()])

func Travel(item):
	var game = get_game()
	game.set_location(item)
	game.update_prices()

func get_game():
	return get_parent().get_parent()
