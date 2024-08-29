if file_exists("Save.sav") {
	ini_open("Save.sav");
	
	var roomStr = ini_read_string("Save1", "room", "rm_default");
	x = ini_read_real("Save1","x",0);
	y = ini_read_real("Save1","y",0);
	ini_close();
	
	var foundRoomId = asset_get_index(roomStr);
	
	// If the room isn't valid, make sure we load the default one
	if (foundRoomId == -1)
	{
		foundRoomId = asset_get_index("rm_default");
	}
	
	room_goto(foundRoomId);
}