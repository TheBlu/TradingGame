extends HBoxContainer

func _ready():
	get_child(0).get_child(0).set_text(get_name())