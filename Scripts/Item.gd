extends HBoxContainer

func _ready():
	update()

func update():
	get_child(0).get_child(0).set_text(get_name())