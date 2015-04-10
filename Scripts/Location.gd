extends CenterContainer

var prices_mod = {"Hydrogen": 3, "Helium": -7}
var prices_base = {"Hydrogen": 5, "Helium": 20}
var prices = prices_base

func _ready():
	update()

func update():
	get_child(0).set_text(get_name())
	var items = prices.keys()
	for i in range(prices.size()):
		var item = items[i]
		prices[item] = prices_base[item] + prices_mod[item]