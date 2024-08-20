
if (cursor_i >= 0 && oGame.block_counts[cursor_i] && instance_exists(oGame.blocks[cursor_i])) {
	draw_sprite_ext(sBlockOutline, outline_index, wallx, wally, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
	draw_sprite_ext(oGame.blocks[cursor_i].sprite_index, cursor_index, wallx, wally, image_xscale, image_yscale, cursor_angle, can_place? image_blend : c_gray, image_alpha);
}

draw_self()

draw_sprite_ext(sCursorHands, image_index, handx, handy, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
