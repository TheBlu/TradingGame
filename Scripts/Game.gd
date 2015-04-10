extends Control

var inventory = {}

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

func update_prices():
	var location = get_location()
	var trade = get_child(1).get_child(0)
	var items = trade.get_child(0)
	var travel = get_child(1).get_child(1)
	for i in range(items.get_child_count()):
		var item = items.get_child(i)
		var price = travel.get_node(location).prices[item.get_name()]
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
	var location = get_child(0).get_child(0).get_child(1).get_child(1)
	return location.get_text()
