/// @description Initialize Object

/* Movement & Collision */
movement_speed = 100;
is_moving = false;
collision_object = undefined;
collision_line_length = 20;

dir = 0; 
enum DIRECTION {
	DOWN,
	LEFT,
	RIGHT,
	UP
}	

/* Animation */
sprite_index = spr_player;
image_index = 0;

animations = {
	down:	{frames: [ 0, 3 ], speed: 6 },
	left:	{frames: [ 4, 5 ], speed: 6 },
	right:	{frames: [ 6, 7 ], speed: 6 },
	up:		{frames: [ 8, 11], speed: 6 },
}

function set_animation(_state) {
	passed_animation = animations[$ _state];
	animation_frames = passed_animation.frames;
	animation_speed = passed_animation.speed;
}

set_animation("down");
