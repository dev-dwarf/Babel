jump = false
red = global.pause;

image_speed = 0;
image_index = red? 1 : 0;

// variants
if (sprite_index == sWall_0) {
	if (chance(10 + red*70)) {
		sprite_index = choose(sWall_0, sWall_1, sWall_2, sWall_3, sWall_4); 
	} else if (!red) {
		sprite_index = sWall_bg;
		image_index = irandom(image_number);
	}
}

if (sprite_index == sWallBig_0) {
	if (chance(10 + red*70)) {
		sprite_index = choose(sWallBig_0, sWallBig_1); 
	} else if (!red) {
		sprite_index = sWallBig_bg;
		image_index = irandom(image_number);
	}
}

if (sprite_index == sWallTall_0) {
	if (chance(10 + red*70)) {
		sprite_index = choose(sWallTall_0); 
	} else if (!red) {
		sprite_index = sWallTall_bg;
		image_index = irandom(image_number);
	}
}

if (sprite_index == sWallLong_0) {
	if (chance(10 + red*70)) {
		sprite_index = choose(sWallLong_0, sWallLong_1); 
	} else if (!red) {
		sprite_index = sWallLong_bg;
		image_index = irandom(image_number);
	}
}

if (chance(50)) {
	x += sprite_width;
	image_xscale = -1;
}
