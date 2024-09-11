save_time = 0;
target_entrance = undefined;

/// @description Attempts to load the game from an existing save file,
/// if one doesn't exist then it will be created and the default room will be loaded
/// @param {string} _default_room_override_str (optional) force it to load this room instead of the default room
load = function(_debug_room_override_str = "")
{	
	if file_exists("Save.sav") 
	{
		var _default_room = (_debug_room_override_str != "") ? "rm_default" : _debug_room_override_str;
		var _file = file_text_open_read("Save.sav");
	
		try 
		{
			global.savedata = json_decode(file_text_read_string(_file))
			global.progress = ds_map_find_value(global.savedata, "progress")
			global.player_data = ds_map_find_value(global.savedata, "player")
		
			fill_in_empty_savedata()
	
			var _loaded_room = asset_get_index(ds_map_find_value(ds_map_find_value(global.savedata, "player"), "room"));
			obj_player.x = ds_map_find_value(global.player_data, "x")
			obj_player.y = ds_map_find_value(global.player_data, "y")
			room_goto(_loaded_room);
		}
		// For now, failing to read it just makes us default to no save
		catch (_exception) 
		{
			create_empty_savedata()
			show_debug_message(_exception.message)
			room_goto(asset_get_index(_default_room));
		}
	}
	else 
	{
		create_empty_savedata()
	}
}

/// @description Saves to an existing file or creates a new file and writes to it if one doesn't already exist
save = function()
{
	if file_exists("Save.sav"){
		file_delete("Save.sav.bak");
		file_copy("Save.sav", "Save.sav.bak")
		file_delete("Save.sav");
	}
	
	var _file = file_text_open_write("Save.sav");
	
	ds_map_replace(ds_map_find_value(global.savedata, "player"), "x", obj_player.x);
	ds_map_replace(ds_map_find_value(global.savedata, "player"), "y", obj_player.y);
	ds_map_replace(ds_map_find_value(global.savedata, "player"), "room", room_get_name(room));
	ds_map_replace(ds_map_find_value(global.savedata, "player"), "time", get_total_game_time());
	
	var _save_contents = json_encode(global.savedata, false);
	show_debug_message("Saved with values: {0}", _save_contents);
	file_text_write_string(_file, _save_contents);
	file_text_close(_file);
}

/// @description Sets the player position to one on the collision map if they aren't on one already
move_player_to_safe_pos = function()
{
	// Player is at unsafe pos if they're on an invalid tile on the set or on a collision tile
	var tileset_tile_id = tilemap_get_at_pixel(layer_tilemap_get_id("Tileset"), obj_player.x, obj_player.y);
	var collision_tile_id = tilemap_get_at_pixel(layer_tilemap_get_id("Collision"), obj_player.x, obj_player.y);
	
	var is_on_map = tileset_tile_id != 0;
	var is_in_collision = collision_tile_id != 0;
	
	if !is_on_map || is_in_collision 
	{
		var old_x = obj_player.x;
		var old_y = obj_player.y;
		
		var new_x = obj_player_spawn.x;
		var new_y = obj_player_spawn.y;
		obj_player.x = new_x;
		obj_player.y = new_y;
		
		show_debug_message($"[DEBUG] Moved player to new safe position, now at: {obj_player.x}, {obj_player.y} from {old_x}, {old_y}");
	}
}

create_empty_savedata = function() 
{
	global.savedata = ds_map_create();   // This is the full savedata, careful with access here
	global.progress = ds_map_create();   // This is specifically for any extra storage, go wild
	global.player_data =  ds_map_create();  // Situation-agnostic player data.
	ds_map_add_map(global.savedata, "player", global.player_data)
	ds_map_add_map(global.savedata, "progress",  global.progress)
	fill_in_empty_savedata()
}

fill_in_empty_savedata = function() 
{
	ds_map_add(global.player_data, "x", x)
	ds_map_add(global.player_data, "y", y)
	ds_map_add(global.player_data, "room", room_get_name(rm_testbed))
	ds_map_add(global.player_data, "name", "CHARA")
	ds_map_add(global.player_data, "exp", 0)
	ds_map_add(global.player_data, "love", 0)
	ds_map_add(global.player_data, "time", 0)
}

format_seconds = function(_seconds) {
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

get_total_game_time = function()
{
	var prevTotal = ds_map_find_value(global.player_data, "time");
	
	return prevTotal + current_time;
}