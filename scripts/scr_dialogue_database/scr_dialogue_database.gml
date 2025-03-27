function load_ds_grid() {
	var _file_buffer = buffer_load("en-us.txt");
	var _s = buffer_read(_file_buffer, buffer_string);
	buffer_delete(_file_buffer);
	
	var _strings = string_split(_s, "CRLF", true);
	var _grid_places [];
	for(var _x = 0; _x < array_length(_strings); _x++) {
		_strings[_x] = string_trim(_strings[_x]);
		_grid_places[_x] = string_split(_strings[_x], ";", true);
	}
	
	ds_table = ds_grid_create(7, array_length(_strings));
	
	for(var _x = 0; _x < array_length(_grid_places); _x++) {
		for(var _y = 0; _y < array_length(_grid_places[_x]); _y++) {
			ds_grid_add(ds_table, _y, _x, _grid_places[_x, _y]);
		}
	}
	
	return ds_table;
}

function get_dialogue_csv(_name) {
	var _y = 0;
	ds_table = load_ds_grid();
	
	/*  -------------for multi-language support------------------
	if(lang == "en") {
		curr_ds_table = ds_table_en;
	} else if(lang == "jp") {
	curr_ds_table = ds_table_ja;
	}
	
	--------------printing ds_table for debugging-----------------
	for(var _x = 0; _x < ds_grid_height(ds_table); _x++) {
		for(var _z = 0; _z < ds_grid_width(ds_table); _z++) {
			show_debug_message(ds_grid_get(ds_table, _z, _x));
			show_debug_message($"value for {_z} {_x}");
		}
	}*/
	
	if(ds_grid_value_exists(ds_table, 0, 0, 0, ds_grid_height(ds_table), _name)) {
		_y = ds_grid_value_y(ds_table, 0, 0, 0, ds_grid_height(ds_table), _name);
	}

	var _text = {
		text: ds_grid_get(ds_table, 1, _y),
		txt_speed: real(ds_grid_get(ds_table, 2, _y)),
		font: asset_get_index(ds_grid_get(ds_table, 3, _y)),
		next: ds_grid_get(ds_table, 4, _y),
		auto: bool(ds_grid_get(ds_table, 5, _y))
	};
	_text.next = _text.next == "undefined" ? undefined : _text.next;

	return _text;
}