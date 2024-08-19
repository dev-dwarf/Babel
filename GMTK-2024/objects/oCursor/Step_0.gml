
if (mouse_lock) {
	if (abs(lock_mousex - mouse_x) > 3 or abs(lock_mousey - mouse_y) > 3) {
		mouse_lock = false;
	}
} else {
	mousex = approach(mousex, mouse_x, 10);
	mousey = approach(mousey, mouse_y, 10);
	
	lock_mousex = 0;
	lock_mousey = 0;
}

if (global.pause) {
	spd = approach(spd, 0.25, 0.01);
	
	wallx = floor(mousex/16)*16;
	wally = floor(mousey/16)*16;

	var placex = oCursor.cursor_obj.sprite_width/2+wallx;
	var placey = oCursor.cursor_obj.sprite_height/2+wally;
	
	handx = lerp(handx, placex, 2*spd);
	handy = lerp(handy, placey, 2*spd);
	
	x = lerp(x, placex, spd);
	y = lerp(y, placey, spd);
	

	if (mouse_check_button_pressed(mb_left)) {
		if (place_meeting(wallx,wally,oPlace) && !place_meeting(wallx,wally,oWall)) {
			with (instance_create_depth(wallx,wally,depth+1,cursor_obj)) {
				image_index = other.cursor_index;	
			}
			cursor_index += 1 + irandom(cursor_obj.image_number-1);
		
			oCamera.screenshake += 1;
			
			mousey -= cursor_obj.sprite_height;
			mouse_lock = true;
			
			if (lock_mousex == 0) {	
				lock_mousex = mouse_x;
			}
			if (lock_mousey == 0) {
				lock_mousey = mouse_y;	
			}
		}
	}
	
	if (mouse_check_button(mb_right)) {
		mouse_lock = false;
		
		var wall = instance_place(wallx,wally,oWall);
		if (wall && wall.red) {
			instance_destroy(wall);
		}	
	}
} else {
	// fuckoff offscreen
	spd = lerp(spd, 16, 0.2);
	x = approach(x, oPlayer.x - 640, spd);
	y = approach(y, oPlayer.y - 640, spd);
	
	wallx = lerp(wallx, x, 0.2);
	wally = lerp(wally, y, 0.2);
	
	handx = lerp(handx, x, 0.2);
	handy = lerp(handy, y, 0.2);
}

sprite_index = sCursor;

if (!instance_exists(cursor_obj)) {
	instance_create_depth(-640, -640, depth, cursor_obj);	
}
mask_index = cursor_obj.sprite_index;

angle_speed = lerp(angle_speed, 0.2, 0.1);
if (abs(target_cursor_angle - cursor_angle) < 0.2) {
	angle_speed = 0;
	cursor_angle = target_cursor_angle;
}
cursor_angle = lerp(cursor_angle, target_cursor_angle, angle_speed);	