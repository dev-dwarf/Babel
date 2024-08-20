if !instance_exists(oCursor) {
	exit;
}	

var N = array_length(blocks);

if (global.pause) {
	mask_index = sBlockHolder;
	pausex = lerp(pausex, 24, 0.2);
} else {
	pausex = approach(pausex, -100, 6);
}	

oCursor.demon_guy = false;
for (var i = 0; i < N; i++) {
	block_scale[i] = lerp(block_scale[i], 1.0, 0.2);

	var NN = 3;
	var ii = i mod NN;
	var jj = floor(i / NN);
	var xx = (jj? room_width - 16 - pausex : pausex) + 1*sin(current_time*0.006 + i*30);
	var yy = 160 + (ii - 0.5*min(N,NN))*80 + 3*sin(current_time*0.002 - i*15) + lerp(4, 0, 1 - abs(1 - 3*block_scale[i]));

	draw_sprite_ext(sBlockHolder, 0, xx, yy, 1, 1, 0, image_blend, image_alpha);
	
	var n = clamp(block_counts[i] - (i == oCursor.cursor_i), 0, 99);
	if (n > 0) {
		draw_sprite_ext(blocks[i].sprite_index, block_index[i], xx - 0.5*blocks[i].sprite_width*block_scale[i], yy  - 0.5*blocks[i].sprite_height*block_scale[i], block_scale[i], block_scale[i], 0, image_blend, image_alpha);
	}
	
	var c = c_black;
	var s = "x" + string(n);
	draw_text_color(xx-1, yy-1, s, c, c, c, c, 1.0);
	draw_text_color(xx-1, yy+1, s, c, c, c, c, 1.0);
	draw_text_color(xx+1, yy+1, s, c, c, c, c, 1.0);
	draw_text_color(xx+1, yy-1, s, c, c, c, c, 1.0);
	draw_text(xx, yy, s);

	var coll = place_meeting(xx, yy, oCursor);
	oCursor.demon_guy |= coll;
	if (mouse_check_button_pressed(mb_left) && coll) {
		if (oCursor.cursor_i == i) {
			oCursor.cursor_i = -1;
			block_index[i] = oCursor.cursor_index;
		} else {
			if (oCursor.cursor_i >= 0) {
				block_index[oCursor.cursor_i] = oCursor.cursor_index;
			}
			
			oCursor.cursor_obj = blocks[i];
			oCursor.cursor_index = block_index[i];
			oCursor.cursor_i = i;
			
			block_index[i] = irandom(blocks[i].image_number);
		}
		
		block_scale[i] = 0;
	}
}
