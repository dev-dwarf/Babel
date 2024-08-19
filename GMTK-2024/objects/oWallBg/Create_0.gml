event_inherited();

red = global.pause;
i = -1;

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
} else {
	image_index = irandom(image_number);
}
