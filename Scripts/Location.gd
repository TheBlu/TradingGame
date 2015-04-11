extends CenterContainer

var prices_mod = {}
var prices_base = {}
var prices = prices_base
var locationdata = {}#{"Estonia": {"base": {"Hydrogen": 10, "Helium": 30}, "mod": {"Hydrogen": 2, "Helium": 3}}}

func _ready():
	# Set locations
	locationdata["Estonia"] = {}
	locationdata["Greece"] = {}
	# Set price sets
	var price_sets = ["base", "mod"]
	for key in locationdata.keys():
		for set in price_sets:
			locationdata[key][set] = {}
	locationdata["Estonia"]["base"]["Hydrogen"] = 10
	locationdata["Estonia"]["base"]["Helium"] = 30
	locationdata["Estonia"]["mod"]["Hydrogen"] = 2
	locationdata["Estonia"]["mod"]["Helium"] = 3
	locationdata["Greece"]["base"]["Hydrogen"] = 5
	locationdata["Greece"]["base"]["Helium"] = 40
	locationdata["Greece"]["mod"]["Hydrogen"] = 2
	locationdata["Greece"]["mod"]["Helium"] = 3
	print(locationdata)
	update()

func update():
	get_child(0).set_text(get_name())
	var items = prices.keys()
	for i in range(prices.size()):
		var item = items[i]
		prices[item] = prices_base[item] + prices_mod[item]