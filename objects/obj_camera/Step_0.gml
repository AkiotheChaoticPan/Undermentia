/// @description Insert description here
// You can write your code in this editor

if(keyboard_check_pressed(vk_tab)) {
	show_debug_message("Tab")
	cam_width += (zoom_width - cam_width) / cam_zoom_lerp;
	cam_height += (zoom_height - cam_height) / cam_zoom_lerp;
	camera_set_view_size(view_camera[0], cam_width, cam_height);
}