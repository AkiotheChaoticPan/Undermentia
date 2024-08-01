/// @description Draw Call

image_index = anim_bound(image_index, animation_frames);
sprite_set_speed(sprite_index, animation_speed, spritespeed_framespersecond);
draw_self();

/* DEBUG
draw_set_color(c_red);

if (dir == DIRECTION.UP) { // Up
	draw_line(x, y, x, y - collision_line_length)	
}
if (dir == DIRECTION.RIGHT) { // Right
	draw_line(x, y, x + collision_line_length, y)	
}
if (dir == DIRECTION.DOWN) { // Down
	draw_line(x, y, x, y + collision_line_length)	
}
if (dir == DIRECTION.LEFT) { // Left
	draw_line(x, y, x - collision_line_length, y)	
}
*/