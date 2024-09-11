/// @description Insert description here
// You can write your code in this editor

// Valid room to change to
if (target_room != pointer_null)
{
	obj_globalmanager.target_entrance = target_entrance_name;
	room_goto(target_room);
}
else
{
	show_debug_message($"ERROR: {id} doesn't have a target room set on it");
}