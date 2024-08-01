/* bound(): Binds an image_index to a certain range of values.
 *			Wraps around to the min if it ever goes over the max.
 * Parameters:
 *		_num: A given image_index
 *		_range: A range of minimum and maximum values (e.g [0, 5])
 *				Numbers listed past the first two are ignored.
 */
function anim_bound(_index, _range)
{
	var _over = 0.99; 
	
	/* '_over' is necessary as 'image_index' is a decimal and 
		will otherwise just skip over the final frame. */
	if(_index >= _range[1] + _over or _index < _range[0])
	{
		return _range[0];
	}
	
	return _index;
}