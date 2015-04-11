extends Panel

func _ready():
	update()

func update():
	get_info().get_child(0).set_text(get_name())

func get_info():
	return get_child(0).get_child(0)
	
func set_owned(amount):
	get_info().get_child(1).set_text(str(amount))