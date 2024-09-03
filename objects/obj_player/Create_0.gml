#region Movement & Collision 

movement_speed = 100;
is_moving = false;
dir = 0; 
enum DIRECTION {
	DOWN,
	LEFT,
	RIGHT,
	UP
}	

collided_trigger = undefined; // Stores a reference to a trigger object you are looking at
collided_length = 20; // Defines how far away you can grab a trigger object's reference
trigger_map = layer_tilemap_get_id("Triggers");
collision_map = layer_tilemap_get_id("Collision");

#endregion

#region Animation 

sprite_index = spr_player;
image_index = 0;

animation_frames = []
animation_speed = 0

animations = {
	down:	{ frames: [ 0, 3 ], speed: 6 },
	left:	{ frames: [ 4, 5 ], speed: 6 },
	right:	{ frames: [ 6, 7 ], speed: 6 },
	up:		{ frames: [ 8, 11], speed: 6 },
}

/* get_animation(): Takes an animation state and gets the frames & speed for use in the Draw call.
 *		_state: A passed animation state, used to index data from animations{}.
 */
function get_animation(_state) {
	passed_animation = animations[$ _state];
	animation_frames = passed_animation.frames;
	animation_speed = passed_animation.speed;
}

get_animation("down");


#endregion

