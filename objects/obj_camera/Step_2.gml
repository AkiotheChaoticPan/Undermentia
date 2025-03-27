/// @description Update Camera Position

if (instance_exists(cam_focus)) {
    x_to = cam_focus.x;
    y_to = cam_focus.y;
}

x += (x_to - x) / cam_follow_lerp + 1;
y += (y_to - y) / cam_follow_lerp + 1;

camera_set_view_pos(view_camera[0], x - (cam_width * 0.5), y - (cam_height * 0.5));