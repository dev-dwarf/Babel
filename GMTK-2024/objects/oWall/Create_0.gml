jump = false
red = global.pause;

image_speed = 0;
image_index = red? 1 : 0;

// variants
if (sprite_index == sWall) {
	if (chance(10 + red*70)) {
		sprite_index = choose(sWall, sWall_1, sWall_2, sWall_3, sWall_4); 
	}
}