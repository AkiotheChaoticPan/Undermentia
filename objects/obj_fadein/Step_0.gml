image_alpha += fade_speed;
show_debug_message(image_alpha);
if(image_alpha >= 1) {
	instance_destroy();
}