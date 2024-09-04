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

function _extract_seconds() {
	var _total_milis = current_time - global.starting_time
	return floor(_total_milis / 1000)
}

function _format_seconds(_seconds) {
	var _minutes = _seconds div 60
	var _hours = _minutes div 60
	
	var _minutes_text = "00"
	var _hours_text = "00"
	
	if (_minutes > 0 && _minutes < 10) {
		_minutes_text = string_concat("0", string(_minutes))
	} else if (_minutes > 0) {
		_minutes_text = string(_minutes)
	}

	if (_hours > 0 && _hours < 10) {
		_hours_text = string_concat("0", string(_hours))
	} else if (_hours > 0) {
		_hours_text = string(_hours)
	}
	
	return string_concat(_hours_text, ":", _minutes_text)
}


save_time = ds_map_find_value(global.player_data, "time")
save_time_string = _format_seconds(save_time)