/// @description

#region Animation 

sprite_index = spr_player;
image_index = 0;

animation_frames = []
animation_speed = 0

animation_overridespeed = -1

animations = {
	playerdown:		{ frames: [ 0, 3 ], speed: 6 },
	playerleft:		{ frames: [ 4, 5 ], speed: 6 },
	playerright:	{ frames: [ 6, 7 ], speed: 6 },
	playerup:		{ frames: [ 8, 11], speed: 6 },
	savepoint:		{ frames: [ 0, 1 ], speed: 6 },
}

/* get_animation(): Takes an animation state and gets the frames & speed for use in the Draw call.
 *		_state: A passed animation state, used to index data from animations{}.
 */
function get_animation(_state) {
	passed_animation = animations[$ _state];
	animation_frames = passed_animation.frames;
	animation_speed = passed_animation.speed;
	animation_overridespeed = -1
}

get_animation("playerdown");
animation_overridespeed = 0

#endregion
