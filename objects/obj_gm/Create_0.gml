
/// @description Attempts to load the game from an existing save file,
/// if one doesn't exist then it will be created and the default room will be loaded
/// @param {string} _default_room_override_str (optional) force it to load this room instead of the default room
load = function(_debug_room_override_str = "")
{
	ini_open("Save.sav");
	
	var default_room_str = (_debug_room_override_str == "" ? "rm_default" : _debug_room_override_str);
	var room_str = ini_read_string("Save1", "room", default_room_str);
	obj_player.x = ini_read_real("Save1","x",0);
	obj_player.y = ini_read_real("Save1","y",0);
	
	ini_close();
	
	var found_room_id = asset_get_index(room_str);
	
	// If the room isn't valid, make sure we load the default one
	if (found_room_id == -1)
	{
		found_room_id = asset_get_index(default_room_str);
	}
	
	room_goto(found_room_id);
}

/// @description Saves to an existing file or creates a new file and writes to it
/// if one doesn't already exist
save = function()
{
	if file_exists("Save.sav")
	{
		file_delete("Save.sav");	
	}
	
	ini_open("Save.sav");
	ini_write_string("Save1","room", room_get_name(room))
	ini_write_real("Save1","x",obj_player.x);
	ini_write_real("Save1","y",obj_player.y)
	
	show_debug_message("[DEBUG] Saved with values: {0}, {1}, {2}", room_get_name(room), obj_player.x, obj_player.y)
	
	ini_close();
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