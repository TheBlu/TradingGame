extends VBoxContainer

var logger
var items

var locationdata = {}
func _ready():
	items = get_child(0)
	logger = get_child(1)
	logger.set_scroll_follow(true)
	var travel = get_game().get_child(1).get_child(1)
	#save_locations()
	load_locations()
	var locations = locationdata.keys()
	var location_class = preload("res://Scenes/Location.scn")
	for location in locations:
		var prices = locationdata[location]
		var loc = location_class.instance()
		loc.prices_base = prices["base"]
		loc.prices_mod = prices["mod"]
		loc.update()
		travel.add_child(loc)
		loc.set_name(location)
		
	for item in items.get_children(): # Iterate over Items
		item.get_child(2).get_child(0).connect("pressed", self, "Buy", [item])
		item.get_child(3).get_child(0).connect("pressed", self, "Sell", [item])

func Buy(item):
	var name = item.get_name()
	var amount = item.get_child(1).get_child(1).get_value()
	var cost = get_price(item) * amount
	var game = get_game()
	if game.get_money() >= cost:
		game.Bought(item, amount, cost)
		logger.newline()
		logger.add_text("Bought " + str(amount) + " " + name + " for " + str(cost) + " gold.")
	else:
		logger.newline()
		logger.add_text("Can't buy " + str(amount) + " " + name + ", costs " + str(cost) + " gold and you have only " + str(game.get_money()) + " gold.")
	
func Sell(item):
	var name = item.get_name()
	var amount = item.get_child(1).get_child(1).get_value()
	var cost = get_price(item) * amount
	var game = get_game()
	if game.inventory.has(name) and amount <= game.inventory[name]:
		game.Sold(item, amount, cost)
		logger.newline()
		logger.add_text("Sold " + str(amount) + " " + name + " for " + str(cost) + " gold.")

func set_price(item, price):
	item.get_child(0).get_child(2).set_text(str(price))

func get_price(item):
	return item.get_child(0).get_child(2).get_text().to_int()

func save_locations():
	var cf = ConfigFile.new()
	var locations = locationdata.keys()
	for location in locations:
		var keys = locationdata[location].keys()
		for key in keys:
			cf.set_value(location, key, locationdata[location][key])
	var err = cf.save("res://locations.conf")

func load_locations():
	var cf = ConfigFile.new()
	var err = cf.load("res://locations.conf")
	var locations = cf.get_sections()
	for location in locations:
		var keys = cf.get_section_keys(location)
		locationdata[location] = {}
		for key in keys:
			locationdata[location][key] = cf.get_value(location, key)

func get_game():
	return get_parent().get_parent()

