
if (i >= 0) {
	oGame.block_counts[i]++;
	if (oCursor.cursor_i == i) {
		oGame.block_index[i] = oCursor.cursor_index;
		oCursor.cursor_index = image_index;
	}

	oCamera.screenshake += 1;
}