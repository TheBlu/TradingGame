# TradingGame

This is a game where you can trade various goods between different locations, built using Godot Engine.
You can modify the types of goods and the trading locations to meet your tastes in the Location.scn class.
Any suggestions/ideas are very welcome. You can contact me at tanel58@hotmail.com or at #godotengine on Freenode(if I'm there).


The format of locationdata looks like this:
```

# Set locations
locationdata["Location1"] = {}
locationdata["Location2"] = {}
# Set price sets
var price_sets = ["base", "mod"]
for key in locationdata.keys():
	for set in price_sets:
		locationdata[key][set] = {}
locationdata["Location1"]["base"]["Item1"] = 10
locationdata["Location1"]["mod"]["Item1"] = 2
locationdata["Location1"]["base"]["Item2"] = 30
locationdata["Location1"]["mod"]["Item2"] = 3
locationdata["Location2"]["base"]["Item1"] = 10
locationdata["Location2"]["mod"]["Item1"] = 2
locationdata["Location2"]["base"]["Item2"] = 30
locationdata["Location2"]["mod"]["Item2"] = 3
```
Each location has two dictionaries: one for the base prices and one for the modifiers.
Modifiers should ideally change with season, but for now, they are static.