// Set up the camera on room start
camera_set_view_border(global.camera, cam_width, cam_height);

x = cam_focus.x;
y = cam_focus.y;

view_enabled = true;
view_visible[0] = true;
view_set_camera(0, global.camera);

//viewport
window_set_size(1920, 1080);
surface_resize(application_surface, 1920, 1080);