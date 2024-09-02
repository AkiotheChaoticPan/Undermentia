/// @description

width = 280;
height = 110;

top_left_corner = [x-width/2, y-height/2]
bottom_right_corner = [x+width/2, y+height/2]

should_destroy = false
has_saved = false

padding_y = 20
padding_x = 48

padding_y_options = padding_y + 4
padding_x_options = padding_x + 24

option_space = 16

pos = 0

option[0] = "Continue"
option[1] = "Save"

op_length = array_length(option)

function save() {
	if file_exists("Save.sav"){
		file_copy("Save.sav", "Save.sav.bak")
		file_delete("Save.sav");
	}
	
	ini_open("Save.sav");
	ini_write_string("player","room", room_get_name(room))
	ini_write_real("player","x",obj_player.x);
	ini_write_real("player","y",obj_player.y)
	
	show_debug_message("Saved with values: {0}, {1}, {2}", room_get_name(room), obj_player.x, obj_player.y)
	
	ini_close();
}