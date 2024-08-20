
if (cursor_i >= 0 && oGame.block_counts[cursor_i] && instance_exists(oGame.blocks[cursor_i])) {
	
	var ww = oGame.blocks[cursor_i].sprite_width;
	var hh = oGame.blocks[cursor_i].sprite_height;
	repeat(2) {
		with instance_create_depth(wallx + irandom(ww), wally + irandom(hh) - 2, -1, oFx) {
			speed = random_range(0.4, 0.65);
			image_speed = random_range(0.9, 1.2);
			direction = 90;
			sprite_index = sFXBlock;
		}
	}
	
	draw_sprite_ext(sBlockOutline, outline_index, wallx, wally, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
	draw_sprite_ext(oGame.blocks[cursor_i].sprite_index, cursor_index, wallx, wally, image_xscale, image_yscale, cursor_angle, can_place? image_blend : c_gray, image_alpha);
}

if (cursor_i < 0) {
	var wall = instance_place(wallx, wally, oWallRed); 
	
	if (wall) {
		if (chance(50)) {
			with instance_create_depth(wall.x - 2 + irandom(wall.sprite_width+4), wall.y + irandom(wall.sprite_height) - 2, -1, oFx) {
				image_speed = random_range(0.9, 1.2);
				speed = random_range(0.4, 0.65);
				direction = 90;
				sprite_index = sFXBlock;
			}
		}	
		
		var oo = (wall.sprite_width > 16) + 2*(wall.sprite_height > 16)
		draw_sprite_ext(sBlockOutlineThin, oo, wall.x, wall.y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
		draw_sprite(wall.sprite_index, wall.image_index, wall.x, wall.y);

	}
}

draw_self()

draw_sprite_ext(sCursorHands, image_index, handx, handy, image_xscale, image_yscale, image_angle, image_blend, image_alpha);

