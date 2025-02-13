//grid
var 
_w = ceil(room_width/TS),
_h = ceil(room_height/TS);

global.mp_grid = mp_grid_create(-32,-32,_w+32,_h+32,TS,TS);
mp_grid_add_instances(global.mp_grid,objWall,false);
