if instance_exists(objPlayer){
	playerX = instance_nearest(x,y,objPlayer).x;
	playerY = instance_nearest(x,y,objPlayer).y;
}

if (global.pause) {
	path_end();
	exit;
}


var 
	_x = playerX  +lengthdir_x(0,_player_angle+angleMod*1.5),
	_y = playerY-8  +lengthdir_y(0,_player_angle+angleMod*1.5),
	_player_pos  = mp_grid_path(global.mp_grid, _path, x, y-8, _x, _y, 1);
	
	if ( _player_pos ) { 
		path_start(_path,spd,path_action_stop,false);
	}
	
	
switch(allyChar) {
	case character.ladybug:
		sprite_index = sprLadybugIdle;
	break;
	case character.snail:
		sprite_index = sprSnailIdle;
	break;
	case character.bee:
		sprite_index = sprBeeIdle;
	break;
	case character.ant:
		sprite_index = sprAntIdle;
	break;
}