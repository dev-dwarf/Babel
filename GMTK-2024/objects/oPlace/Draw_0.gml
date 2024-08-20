
draw_self();
if (wall != noone && instance_exists(wall)) {
	draw_sprite(wall.sprite_index, wall.image_index, wall.x, wall.y);
	x = wall.x;
	y = wall.y;
} else {
	instance_destroy();	
}