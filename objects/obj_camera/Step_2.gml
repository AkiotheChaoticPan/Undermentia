/// @description Update Camera Position

// Make sure you aren't dividing by 0
if (cam_follow_lerp <= 0) cam_follow_lerp = 1;
if (cam_zoom_lerp <= 0) cam_follow_lerp = 1;

if (cam_focus != noone) {
	x_to = cam_focus.x;
	y_to = cam_focus.y;
}

x += (x_to - x) / cam_follow_lerp;
y += (y_to - y) / cam_follow_lerp;
camera_set_view_pos(view_camera[0], x - (cam_width * 0.5), y - (cam_height * 0.5));