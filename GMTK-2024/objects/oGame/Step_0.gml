if (keyboard_check_pressed(vk_enter)) {
	global.ending = true;	
}

if (global.ending) {
	audio_sound_gain(BABEL_Loop, 0, 100);
	audio_sound_gain(BABEL_Loop_Quiet, global.music_gain, 100);
	exit;	
}

if (room == Finale) exit;

if (room == rInit) {
	if (mouse_check_button_pressed(mb_left)) {
		room_goto_next();	
	}
	exit;
}

if (room != GoatRoom || !never_paused) {
	audio_sound_gain(BABEL_Loop, global.music_gain*(1.0 - global.pause), 100);
	audio_sound_gain(BABEL_Loop_Quiet, global.music_gain*global.pause, 100);
	
	if (!audio_is_playing(BABEL_Loop)) {
		play_sound(BABEL_Loop, 10, true);
		play_sound(BABEL_Loop_Quiet, 10, true);
		
		audio_sound_set_track_position(BABEL_Loop, audio_sound_get_track_position(BABEL_Loop_Quiet));
	}
} else {
	audio_sound_gain(BABEL_Loop, 0, 100);
	audio_sound_gain(BABEL_Loop_Quiet, 0, 100);
}



if (global.pause) {
	never_paused = false;
}

var mark_places = false;
if (last_walls != instance_number(oMakesPlace)) {
	last_walls = approach(last_walls, instance_number(oMakesPlace), 0.5);
	mark_places = true;
}

if (keyboard_check_pressed(vk_space) && global.pause = false) {
	global.pause = true;
	image_index = 0;
	
	oCursor.spd = 0.3;
	mark_places = true;
	
	play_sound(BigFlap, 1, false, 1.0, 0.1, 1.0);
	
	with oWallRed {
		var ww = sprite_width; var hh = sprite_height;
		with instance_create_depth(x,y,-2,oPlace) {
			image_speed = 0;
			image_index = (ww > 16) + 2*(hh > 16);
			alarm[0] = 15;
			if (room == GoatRoom) {
				alarm[0] = 30;
			}
			wall = other.id;
		}	
	}
} else if (keyboard_check_pressed(vk_space) && global.pause = true) {
	global.pause = false;
	image_index = 1;

	// remove places	
	instance_destroy(oPlace);
	
	play_sound(BigFlap, 1, false, 1.0, 0.1, 1.0);
	
	with oPlace {
		instance_destroy();	
	}
}

if (keyboard_check_pressed(vk_right)) {
	if (room != room_last) room_goto_next();
} else if (keyboard_check_pressed(vk_left)) {
	if (room != room_first) room_goto_previous();
}

// mark places
//if (mark_places) {
//	instance_destroy(oPlace);
	
//	with oMakesPlace {
//		for (var i = 0; i < sprite_width-1; i += 16) {
//			instance_create_depth(x+i,y-16,0,oPlace);
//		}
//	}
	
//	with oMakesPlace {
//		if (red && !inv && !place_meeting(x,y+1,oMakesPlace)) {
//			instance_destroy();	
//		}
//	}
	
//	with oScaffold {
//		for (var i = 0; i < sprite_width-1; i += 16) {
//			for (var j = 0; j < sprite_height-1; j += 16) {
//				instance_create_depth(x+i,y+j,0,oPlace);
//			}
//		}	
//	}
//}