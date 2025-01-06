// Sets the current animation
image_index = anim_bind(image_index, animation_frames);
if animation_overridespeed > -1 {
	sprite_set_speed(sprite_index, animation_overridespeed, spritespeed_framespersecond);
} else {
	sprite_set_speed(sprite_index, animation_speed, spritespeed_framespersecond);
}
draw_self();