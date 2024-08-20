global.pause = false;
global.music_gain = 0.5;
global.sound_gain = 0.75;

display_set_gui_size(416, 320);

pausex = -96;

depth = -1

draw_set_font(ChevyRayLantern);

play_sound(BABEL_Loop, 10, true);
play_sound(BABEL_Loop_Quiet, 10, true);

room_goto_next();