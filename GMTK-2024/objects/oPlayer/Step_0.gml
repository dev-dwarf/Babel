if (reset) {
	vsp = 0;
	hsp = 0;
	x = lerp(x, checkpointx, 0.2);
	y = lerp(y, checkpointy, 0.2);
	stamina = lerp(stamina, max_stamina, 0.25);
	walkspd = 1;

	if (abs(x - checkpointx) < 0.1 && abs(y - checkpointy) < 0.1) {
		x = checkpointx;
		y = checkpointy;
		stamina = max_stamina;
		reset = false;
	}
}

if (!global.pause) {
	vsp = vsp + grv;
	hsp = walkspd;

	if (place_meeting(x,y+1,oWall)) {
		if (!grounded) {
			with instance_create_depth(x,y,depth+1,oFx) {
				sprite_index = sFxLand;	
			}		
		}
		
		grounded = true;
	} else {
		grounded = false;	
	}

	if (grounded) {
		var steppingon = instance_place(x,y+1,oWall);
	
		if (steppingon.jump) {
			jump = true;
		}
	
	}

	if (place_meeting(x+hsp,y,oWall)) {
		if (!place_meeting(x+sign(hsp),y,oWall)) {
			x = x + sign(hsp);
		}
		walkspd = -walkspd;
	}

	x = x + hsp;

	if (place_meeting(x,y+vsp,oWall)) {
		if (!place_meeting(x,y+sign(vsp),oWall)) {
			y = y + sign(vsp);
		}
	
		vsp = 0;
	}

	y = y + vsp;

	//Jump
	stamina = clamp(stamina,0,100);
	if (grounded) stamina ++;
	if (jump) && (stamina > 25) {
		jump = false;
		vsp = jumpheight;
		stamina = stamina - 25;
		
		with instance_create_depth(x,y,depth+1,oFx) {
			sprite_index = sFxJump;	
		}
	}
	
	
	if (y > room_height + sprite_height) {
		reset = true;	
	}
	
} else {
	reset = true;
}
