extends HSlider

func _on_HSlider_value_changed(value):
	set_value(format(value))

func format(value):
	return str(round(value))
