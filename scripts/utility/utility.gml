// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

/// @description Uses a custom predicate to find a specific instance of an object
/// @param _predicate is the anonymous function to determine whether the object was found
/// @param _obj_type is the type of object to look for
/// @return the found object or null pointer if nothing matched the predicate
function util_custom_instance_find(_predicate, _obj_type)
{
	var total_instances = instance_number(_obj_type);
	
	for (i = 0; i < total_instances; ++i)
	{
		var curr_obj = instance_find(_obj_type, i);
		
		if (_predicate(curr_obj) == true)
		{
			return curr_obj;
		}
	}
	
	return pointer_null;
}
