/// @description

width = 280;
height = 110;

top_left_corner = [x-width/2, y-height/2]
bottom_right_corner = [x+width/2, y+height/2]

save_room_name = ds_map_find_value(global.player_data, "room")
full_room_name = ds_map_find_value(global.full_room_names, save_room_name)

player_name = ds_map_find_value(global.player_data, "name")

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
	obj_globalmanager.save();
}