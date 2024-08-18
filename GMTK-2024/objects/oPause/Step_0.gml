if (keyboard_check_pressed(vk_space) && global.pause = false)
{
	global.pause = true;
	image_index = 0;
	
	oCursor.spd = 0.3;
}
else if (keyboard_check_pressed(vk_space) && global.pause = true)
{
	global.pause = false;
	image_index = 1;
	
}