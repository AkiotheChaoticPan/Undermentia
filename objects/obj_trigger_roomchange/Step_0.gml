/* TODO: 
 * - I'd like to have an instanced variable for a horizontal collision line so that you 
 *   don't have to awkwardly stretch the scale of this object in the editor
 * e.g:
 *  <------------[ ]------------>
 *
 * - A "simple placement" instance variable that lets you set a direction and, if the default (-1, -1)
 *	 target_x & target_y are provided, it will place you outside the door in the given direction.
 *	 
 * - Some kind of list/tree reference system so designers don't have to hardcode (x,y) coords
 */
 
 if (place_meeting(x, y, obj_player)) {
	if (target_x != pointer_null || target_y != pointer_null) {
		if (target_room != noone) {
			room_goto(target_room);
			obj_player.x = target_x;
			obj_player.y = target_y;
			
		}
	}	
	
	show_debug_message("Room transition failed");
	
 } 

	
