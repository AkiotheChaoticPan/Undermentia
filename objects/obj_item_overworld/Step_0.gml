
// change for when interactable trigger is implemented
/*
if (obj_trigger_interactable.item) { // item is boolean
	inv_add(item);
	instance_destroy();
}*/

if (place_meeting(x, y, obj_player)) {
	inv_add(item);
	instance_destroy();
}