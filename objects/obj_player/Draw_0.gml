/// @description Draw

draw_self();

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
