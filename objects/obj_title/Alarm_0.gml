/// @description Automatically displays the story
if(image_index < frame_count) {
	instance_create_depth(0, 0, 9999, obj_fadein);
	alarm_set(1, 30);
}