event_inherited();

jump = false
red = global.pause;
i = -1;
image_speed = 0;

// variants
if (red) {
	if (sprite_index == sWall) {
		sprite_index = sWall_red;
	}

	if (sprite_index == sWallBig) {
		sprite_index = sWallBig_red;
	}

	if (sprite_index == sWallLong) {
		sprite_index = sWallLong_red;	
	}

	if (sprite_index == sWallTall) {
		sprite_index = sWallTall_red;	
	}
} else {
	image_index = irandom(image_number);
}