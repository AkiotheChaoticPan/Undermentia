/// @function anim_bind:
/// @description Binds an image_index to a certain range of values.
/// @param {real} _index: A given image_index
/// @param {array} _range: A range of minimum and maximum values (e.g [0, 5])

function anim_bind(_index, _range)
{
	var _over = 0.99; 
	
	/* '_over' is necessary as 'image_index' is a decimal number. 
		This makes sure it doesn't skip the final frame. */
	if(_index >= _range[1] + _over or _index < _range[0])
	{
		return _range[0];
	}
	
	return _index;
}