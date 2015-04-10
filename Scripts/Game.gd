extends Control

var inventory = {}

func _ready():
	update_items()

func Bought(item, amount, cost):
	var name = item.get_name()
	if inventory.has(name):
		amount += inventory[name]
	inventory[name] = amount
	set_money(get_money() - cost)
	update_owned(item)

func Sold(item, amount, cost):
	var name = item.get_name()
	if inventory.has(name):
		if amount <= inventory[name]:
			inventory[name] -= amount
			set_money(get_money() + cost)
			update_owned(item)

func update_items():
	var trade = get_child(1).get_child(0)
	var items = trade.get_child(0)
	var travel = get_child(1).get_child(1)
	var locations = trade.locationdata.keys()
	var location = get_location()
	for item in items.get_children():
		item.free()
	var item_types = trade.locationdata[location]["base"]
	var item_class = preload("res://Scenes/Item.scn")
	var keys = item_types.keys()
	for i in range(keys.size()):
		var item = item_class.instance()
		item.set_name(keys[i])
		trade.get_child(0).add_child(item)
		var price = trade.locationdata[location]["base"][item.get_name()] + trade.locationdata[location]["mod"][item.get_name()]
		trade.set_price(item, price)

func update_owned(item):
	var name = item.get_name()
	item.get_child(0).get_child(1).set_text(str(inventory[name]))

func set_money(amount):
	var money = get_child(0).get_child(0).get_child(0).get_child(1)
	money.set_text(str(amount))

func get_money():
	var money = get_child(0).get_child(0).get_child(0).get_child(1)
	return money.get_text().to_int()

func set_location(location):
	get_child(0).get_child(0).get_child(1).get_child(1).set_text(location)

func get_location():
	var location = get_child(0).get_child(0).get_child(1).get_child(1).get_text()
	var trade = get_child(1).get_child(0)
	var locations = trade.locationdata.keys()
	if location == "":
		location = locations[0]
	set_location(location)
	return location
