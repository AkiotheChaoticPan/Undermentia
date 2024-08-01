/// @description Variable Declarations

cam_width = 640;
cam_height = 360;

zoom_width = camera_get_view_width(view_camera[0]);
zoom_height = camera_get_view_height(view_camera[0]);

// Defines smoothness of camera follow/zoom
cam_follow_lerp = 5;
cam_zoom_lerp = 10;

cam_zoom_level = 1;
cam_focus = obj_player;

x = cam_focus.x;
y = cam_focus.y;

x_to = x;
y_to = y;