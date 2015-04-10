extends CenterContainer

var prices_mod = {}
var prices_base = {}
var prices = prices_base

func _ready():
	update()

func update():
	get_child(0).set_text(get_name())
	var items = prices.keys()
	for i in range(prices.size()):
		var item = items[i]
		prices[item] = prices_base[item] + prices_mod[item]