/// @description Insert description here
// You can write your code in this editor

// We've come from another room and this room change trigger was the target
if (entrance_name == obj_globalmanager.target_entrance)
{
	// Move the player to this roomchange trigger (just in front to avoid triggering room change again)
	var target_pos_x = x + (facing_dir_x * 32);
	var target_pos_y = y + (-facing_dir_y * 32); // Invert y axis because for some reason GameMaker's y axis up is negative
		
	obj_player.x = target_pos_x;
	obj_player.y = target_pos_y;
		
	show_debug_message($"CHANGED_ROOM to {entrance_name} at {x}, {y}");
	show_debug_message($"PLAYER_POS is now {obj_player.x}, {obj_player.y}");
}