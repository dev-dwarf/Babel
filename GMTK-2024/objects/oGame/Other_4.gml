instance_create_layer(room_width/2, room_height/2, layer, oCamera);
instance_create_layer(-320, -320, layer, oCursor);

last_walls = instance_number(oWall);


switch room {
	case Room_1: {
		blocks = [oWallBig, oWall];
		block_counts = [1, 1];
	} break;
}

var N = array_length(blocks);
block_scale = array_create(N, 1);
block_index = array_create(N, 1);

for (var i = 0; i < N; i++) {
	instance_create_layer(-640, -640, layer, blocks[i]);
}