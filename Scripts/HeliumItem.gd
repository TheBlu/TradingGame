extends HBoxContainer

var price = 20

func _ready():
	get_child(0).get_child(0).set_text(get_name())
	get_child(0).get_child(2).set_text(str(price))