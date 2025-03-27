// Basic Properties
cam_width = 640;
cam_height = 360; // UNDERTALE is 640x480 (4:3) but I'd personally like to shoot for a 16:9 ratio
cam_focus = obj_player;
cam_follow_lerp = 4; // Smoothness of camera tracking (0 = off)

// Create the Camera View
global.camera = camera_create_view(cam_focus.x, cam_focus.y, cam_width, cam_height);
camera_set_view_border(global.camera, cam_width, cam_height);

// Set up the Viewport
window_set_size(1920, 1080); // Hardcoded for now
surface_resize(application_surface, 1920, 1080);

if (cam_focus != pointer_null) {
	x = cam_focus.x;
	y = cam_focus.y;

	x_to = x;
	y_to = y;
}

view_enabled = true;
view_visible[0] = true;
view_set_camera(0, global.camera);