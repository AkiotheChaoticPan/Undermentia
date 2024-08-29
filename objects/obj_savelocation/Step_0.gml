
if place_meeting(x, y, obj_player) && check_confirm_pressed() {
    if file_exists("Save.sav"){
		file_delete("Save.sav");
		
		
	}
	
	ini_open("Save.sav");
	ini_write_string("Save1","room",room_get_name(room));
	ini_write_real("Save1","x",obj_player.x);
	ini_write_real("Save1","y",obj_player.y);
}

