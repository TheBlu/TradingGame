extends TextEdit	

func _ready():
	set_text( str( get_parent().get_child( 1 ).get_value() ) )

func _on_HSlider_value_changed( value ):
	set_text( str( value ) )

func _on_TextEdit_input_event( ev ):
	if ev.is_action("Return"):
		set_text(get_text().replace("\n", "")) # Sets cursor to 0 so user knows value was changed
		get_parent().get_child(1).set_value(int(get_text()))
