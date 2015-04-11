extends Control

var inventory = {}
var exit = false

func _ready():
	set_process(true)
	set_process_input(true)

func _input(event):
	if exit:
		print("input worked")
		Input.action_press("exit")
		#var ev = InputEvent()
		#ev.type = InputEvent.ACTION
		#ev.set_as_action("exit", true)
		#get_tree().input_event(ev)

func exit():
	get_trade().clear_items()
	get_travel().clear()
	get_tree().quit()

func _process(delta):
	if(Input.is_action_pressed("exit")):
		exit()

func _notification(what):
	if what == 7:
		exit()

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

func update_owned(item):
	var name = item.get_name()
	item.get_child(0).get_child(0).get_child(1).set_text(str(inventory[name]))

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
	var trade = get_trade()
	var locations = trade.locationdata.keys()
	if location == "":
		location = locations[0]
	set_location(location)
	return location

func get_trade():
	return get_child(1).get_child(0)

func get_travel():
	return get_child(1).get_child(1)
