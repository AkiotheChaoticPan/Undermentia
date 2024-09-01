
if file_exists("Save.sav") {
	ini_open("Save.sav");
	
	var default_room = room_get_name(rm_testbed);
	var loadedRoom = asset_get_index(ini_read_string("Save1", "room", default_room));
	x = ini_read_real("Save1","x",0);
	y = ini_read_real("Save1","y",0);
	ini_close();
	
	 room_goto(loadedRoom);
}