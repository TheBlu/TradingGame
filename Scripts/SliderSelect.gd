extends TextEdit	

func _ready():
	update()
	
func update():
	set_text(str(get_parent().get_child(1).get_value()))

func _on_HSlider_value_changed(value):
	set_text(format(value))
	stabilize_cursor()

func format(value):
	return str(round(value))

func _on_TextEdit_input_event(ev):
	if ev.is_action("Return"):
		set_text(get_text().replace("\n", ""))
		stabilize_cursor()
		set_slider(get_text())

func stabilize_cursor():
	cursor_set_column(get_text().length())

func set_slider(amount):
	get_parent().get_child(1).set_value(int(amount))

func _on_TextEdit_text_changed():
	set_slider(get_text())
