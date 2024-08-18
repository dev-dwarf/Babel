if (reset) {
	vsp = 0;
	hsp = 0;
	x = lerp(x, checkpointx, 0.2);
	y = lerp(y, checkpointy, 0.2);
	stamina = lerp(stamina, max_stamina, 0.25);
	walkdir = 1;

	if (abs(x - checkpointx) < 0.1 && abs(y - checkpointy) < 0.1) {
		x = checkpointx;
		y = checkpointy;
		stamina = max_stamina;
		reset = false;
	}
}

if (!global.pause) {
	vsp = approach(vsp, 10, grv);
	
	spd = approach(spd, maxspd*stamina/max_stamina, accel);
	hsp = walkdir*spd;

	if (place_meeting(x,y+1,oWall)) {
		if (!grounded) {
			with instance_create_depth(x,y,depth+1,oFx) {
				sprite_index = sFxLand;	
			}
			spd *= 0.25;
			stamina -= 2*vsp;
		}
		
		grounded = true;
	} else {
		grounded = false;	
	}

	if (!jump && grounded) {
		var steppingon = instance_place(x+2*hsp,y+1,oWall);
	
		if (!steppingon && stamina > 25) {
			stamina -= 25;
			jump = true;
		}
	}
	
	//Jump
	if (grounded) stamina += 0.3;
	stamina = clamp(stamina,0,100);
	if (jump) {
		jump = false;
		vsp = jumpheight;
		
		with instance_create_depth(x,y,depth+1,oFx) {
			sprite_index = sFxJump;	
		}
	}

	if (place_meeting(x+sign(hsp),y,oWall)) {
		if (!place_meeting(round(x)+sign(hsp),y,oWall)) {
			x = round(x) + sign(hsp);
		}
		walkdir = -walkdir;
		spd = 0;
		hsp = 0;
	}

	x = x + hsp;

	if (place_meeting(x,y+vsp,oWall)) {
		if (!place_meeting(x,round(y)+sign(vsp),oWall)) {
			y = round(y) + sign(vsp);
		}
	
		vsp = 0;
	} else {
		y = y + vsp;
	}

	if (y > room_height + sprite_height) {
		reset = true;	
	}
	
} else {
	reset = true;
}
