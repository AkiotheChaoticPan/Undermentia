/// @description Initialize Object

movement_speed = 100;
is_moving = false;

collided_object = undefined;
collision_line_length = 20;

sprite_index = spr_player;
image_index = 0;
image_speed = false;

dir = 0; 
enum DIRECTION {
	DOWN,
	LEFT,
	RIGHT,
	UP
}	

animations = {
	down:	{frames: [0, 4 ] },
	left:	{frames: [5, 6 ] },
	right:	{frames: [7, 8 ] },
	up:		{frames: [9, 12] },
}

function set_animation(_state) {
	new_animation = variable_struct_get(animations, _state);
	animation_frames = new_animation.frames;
}