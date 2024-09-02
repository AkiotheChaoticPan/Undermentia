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
		file_delete("Save.sav.bak");
		file_copy("Save.sav", "Save.sav.bak")
		file_delete("Save.sav");
	}
	
	var _file = file_text_open_write("Save.sav");
	
	ds_map_replace(ds_map_find_value(global.savedata, "player"), "x", obj_player.x)
	ds_map_replace(ds_map_find_value(global.savedata, "player"), "y", obj_player.y)
	ds_map_replace(ds_map_find_value(global.savedata, "player"), "room", room_get_name(room))
	
	var _save_contents = json_encode(global.savedata, false)
	show_debug_message("Saved with values: {0}", _save_contents)
	file_text_write_string(_file, _save_contents)
	file_text_close(_file)
}