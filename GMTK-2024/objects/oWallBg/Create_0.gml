red = global.pause;

image_speed = 0;
depth = 3;

if (red) {
	if (sprite_index == sWall_darkbg) {
		sprite_index = sWall_darkred;
	}
	
	if (sprite_index == sWallBig_darkbg) {
		sprite_index = sWallBig_darkred;
	}
	
	if (sprite_index == sWallLong_darkbg) {
		sprite_index = sWallLong_darkred;
	}
	
	if (sprite_index == sWallTall_darkbg) {
		sprite_index = sWallTall_darkred;
	}
}

image_index = irandom(image_number);
