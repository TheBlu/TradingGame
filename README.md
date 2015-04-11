# TradingGame

This is a game where you can trade Hydrogen and Helium between Estonia and Greece.
The types of goods and the trading locations can be changed in locations.conf.

The format looks like this:
```
[Location]
base:{"Item1": Item1price, "Item2": Item2price}
mod:{"Item1": Item1mod, "Item2": Item2mod}
```
Each location has two dictionaries: one for the base prices and one for the modifiers.
Modifiers should ideally change with season, but for now, they are static.