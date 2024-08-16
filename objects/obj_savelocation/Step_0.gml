
if place_meeting(x, y, obj_player) && check_confirm_pressed() {
    if file_exists("Save.sav"){
		file_delete("Save.sav");
		
		
	}
	
	ini_open("Save.sav");
	var Savedroom = room;
	ini_write_real("Save1","room",Savedroom);
	ini_write_real("Save1","x",obj_player.x);
	ini_write_real("Save1","y",obj_player.y)
}

