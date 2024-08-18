
if (global.pause) {
	spd = approach(spd, 0.25, 0.01);
	
	var wallx = floor(mouse_x/16)*16;
	var wally = floor(mouse_y/16)*16;

	placex = oCursor.cursor_obj.sprite_width/2+wallx;
	placey = oCursor.cursor_obj.sprite_height/2+wally;
	
	handx = lerp(handx, placex, 2*spd);
	handy = lerp(handy, placey, 2*spd);
	
	x = lerp(x, placex, spd);
	y = lerp(y, placey, spd);
	

	if (mouse_check_button(mb_left)) {
		if (place_meeting(wallx,wally,oPlace) && !place_meeting(wallx,wally,oWall)) {
			instance_create_depth(wallx,wally,depth+1,cursor_obj);
		
			target_cursor_angle += 90;
			oCamera.screenshake += 1;
		}
	}
	
	if (mouse_check_button(mb_right)) {
		var wall = instance_place(wallx,wally,oWall);
		if (wall) {
			instance_destroy(wall);
			target_cursor_angle -= 90;
			oCamera.screenshake += 1;
		}	
	}
} else {
	// fuckoff offscreen
	spd = lerp(spd, 16, 0.2);
	x = approach(x, oPlayer.x - 360, spd);
	y = approach(y, oPlayer.y - 360, spd);
	
	placex = lerp(placex, x, 0.2);
	placey = lerp(placey, y, 0.2);
	
	handx = lerp(handx, x, 0.2);
	handy = lerp(handy, y, 0.2);
}

if (keyboard_check_pressed(ord("1"))) {
	cursor_obj = oWall;	
}

if (keyboard_check_pressed(ord("2"))) {
	cursor_obj = oWallBig;	
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