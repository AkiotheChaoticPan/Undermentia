/// @description Insert description here
// You can write your code in this editor

if (check_confirm_pressed() && alarm[0] == -1)
{
	show_debug_message("Saved");
	obj_savelocation.image_blend = color_get_red(125);
	
	alarm[0] = 100;
}