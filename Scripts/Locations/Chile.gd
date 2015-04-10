extends CenterContainer

var prices_always = {"Hydrogen": 2, "Helium": 25}
var prices = {"Hydrogen": 5, "Helium": 20}

func _ready():
	get_child(0).set_text(get_name())
	var items = prices.keys()
	for i in range(prices.size()):
		var item = items[i]
		prices[item] = prices_always[item]