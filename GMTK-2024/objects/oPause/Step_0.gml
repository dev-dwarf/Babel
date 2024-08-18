var mark_places = false;
if (last_walls != instance_number(oWall)) {
	last_walls = approach(last_walls, instance_number(oWall), 0.5);
	mark_places = true;
}


if (keyboard_check_pressed(vk_space) && global.pause = false) {
	global.pause = true;
	image_index = 0;
	
	oCursor.spd = 0.3;
	mark_places = true;
	
} else if (keyboard_check_pressed(vk_space) && global.pause = true) {
	global.pause = false;
	image_index = 1;


	// remove places	
	instance_destroy(oPlace);
}

// mark places
if (mark_places) {
	instance_destroy(oPlace);
	with oWall {
		for (var i = 0; i < sprite_width; i += 16) {
			instance_create_depth(x+i,y-16,depth,oPlace);
		}
	}
}