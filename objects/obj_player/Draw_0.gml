// Sets the current animation
image_index = anim_bind(image_index, animation_frames);
sprite_set_speed(sprite_index, animation_speed, spritespeed_framespersecond);
draw_self();

/* Debug Setting; Will be incorporated into a debug mode at a later date!

draw_set_color(c_red);
if (dir == DIRECTION.UP) { // Up
	draw_line(x, y, x, y - collided_length)	
}
if (dir == DIRECTION.RIGHT) { // Right
	draw_line(x, y, x + collided_length, y)	
}
if (dir == DIRECTION.DOWN) { // Down
	draw_line(x, y, x, y + collided_length)	
}
if (dir == DIRECTION.LEFT) { // Left
	draw_line(x, y, x - collided_length, y)	
}
*/