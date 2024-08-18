jump = false
red = global.pause;

image_speed = 0;
image_index = red? 1 : 0;

// variants
if (sprite_index == sWall_0) {
	if (!red) {
		sprite_index = sWall_bg;
		image_index = irandom(image_number);
	}
	if (chance(10 + red*70)) {
		sprite_index = choose(sWall_0, sWall_1, sWall_2, sWall_3, sWall_4); 
	}
}