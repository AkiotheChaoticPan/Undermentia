
if file_exists("Save.sav") {
	ini_open("Save.sav");
	
	var _default_room = room_get_name(rm_testbed);
	var _loaded_room = asset_get_index(ini_read_string("player", "room", _default_room));
	x = ini_read_real("player","x",0);
	y = ini_read_real("player","y",0);
	ini_close();
	
	 room_goto(_loaded_room);
}