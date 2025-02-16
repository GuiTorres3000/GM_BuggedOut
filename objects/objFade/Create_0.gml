spr = sprSquare;

scale = sprite_get_width(spr)*3;

ls = ceil(display_get_gui_height()/scale);
cs = ceil(display_get_gui_width()/scale);

imgVel = sprite_get_speed(spr)/game_get_speed(gamespeed_fps);
imgNum = sprite_get_number(spr) - 1;