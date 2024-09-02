global.savedata = ds_map_create();   // This is the full savedata, careful with access here
global.progress = ds_map_create();   // This is specifically for any extra storage, go wild

if file_exists("Save.sav") {
	var _default_room = room_get_name(rm_testbed);
	var _file = file_text_open_read("Save.sav");
	
	try {
		global.savedata = json_decode(file_text_read_string(_file))
		global.progress = ds_map_find_value(global.savedata, "progress")
	
		var _loaded_room = asset_get_index(ds_map_find_value(ds_map_find_value(global.savedata, "player"), "room"));
		x = ds_map_find_value(ds_map_find_value(global.savedata, "player"), "x")
		y = ds_map_find_value(ds_map_find_value(global.savedata, "player"), "y")
		room_goto(_loaded_room);
	} catch (_exception) {	// For now, failing to read it just makes us default to no save
		create_empty_savedata()
		show_debug_message(_exception.message)
		room_goto(asset_get_index(_default_room));
	}
} else {
	create_empty_savedata()
}