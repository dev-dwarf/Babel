if (room == rInit) {
	exit;	
}

//if (false) {
	
//} else if (room == Room_1) {
//	blocks = [oWallRed, oWallBigRed, oWallLongRed];
//	block_counts = [1, 1, 2];

////} else if (room == Room_2) {
////	blocks = [oWall, oWallBig];
////	block_counts = [1, 1];

//} else {
//	blocks = [oWallRed, oWallBigRed, oWallLongRed, oWallTallRed];
//	block_counts = [10, 10, 10, 10];
//}

blocks = [oWallRed, oWallBigRed, oWallLongRed, oWallTallRed];

var N = array_length(blocks);
block_counts = array_create(N, 0);
block_scale = array_create(N, 1);
block_index = array_create(N, 1);

global.pause = true;
for (var i = 0; i < N; i++) {
	blocks[i] = instance_create_depth(-640, -640+100*i, 0, blocks[i]);
	
	with blocks[i] {
		inv = true;	
	}
	//blocks[i].inv = true;
}
global.pause = false;

last_walls = instance_number(oMakesPlace);

instance_create_depth(room_width/2, room_height/2, 0, oCamera);
instance_create_depth(-320, -320, 0, oCursor);
oCursor.cursor_obj = blocks[0];