//grid
var 
_w = ceil(room_width/TS),
_h = ceil(room_height/TS);

global.mp_grid = mp_grid_create(-32,-32,_w+32,_h+32,TS,TS);
mp_grid_add_instances(global.mp_grid,objWall,false);

depthGrid  = ds_grid_create(2,0);

for( var i = 0; i < array_length(depthArray); i ++ ){
	var _obj = depthArray[i];
	//visible init
	with(_obj){ visible = false; }
	//visible all
	object_set_visible(_obj,false);
}