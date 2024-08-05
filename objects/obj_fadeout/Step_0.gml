image_alpha -= fade_speed;
show_debug_message(image_alpha);
if(image_alpha <= 0) {
	instance_destroy();
}