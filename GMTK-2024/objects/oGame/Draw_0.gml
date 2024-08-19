
if (global.pause) {
	mask_index = sBlockHolder;
	pausex = lerp(pausex, 32, 0.2);
} else {
	pausex = approach(pausex, -100, 6);
}	

var N = array_length(blocks);
for (var i = 0; i < N; i++) {
	block_scale[i] = lerp(block_scale[i], 1.0, 0.2);

	var xx = pausex + 1*sin(current_time*0.006 + i*30);
	var yy = 160 + (i - 0.5*N)*64 + 3*sin(current_time*0.002 - i*15) + lerp(4, 0, 1 - abs(1 - 3*block_scale[i]));
	draw_sprite_ext(blocks[i].sprite_index, block_index[i], xx - 0.5*blocks[i].sprite_width*block_scale[i], yy  - 0.5*blocks[i].sprite_height*block_scale[i], block_scale[i], block_scale[i], 0, image_blend, image_alpha);
	draw_sprite_ext(sBlockHolder, 0, xx, yy, 1, 1, 0, image_blend, image_alpha);

	if (mouse_check_button_pressed(mb_left) && oCursor.cursor_obj != blocks[i] && place_meeting(xx, yy, oCursor)) {
		oCursor.cursor_obj = blocks[i];
		oCursor.cursor_index = block_index[i];
		block_index[i] += irandom(blocks[i].image_number);
		block_scale[i] = 0;
	}
}
