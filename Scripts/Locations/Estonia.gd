extends CenterContainer


var item_amount = 2
var prices_always = {"Hydrogen": 10, "Helium": 30}
var prices = {"Hydrogen": 5, "Helium": 20}

func _ready():
	get_child(0).set_text(get_name())
	var items = prices.keys()
	for i in range(prices.size()):
		var item = items[i]
		prices[item] = prices_always[item]