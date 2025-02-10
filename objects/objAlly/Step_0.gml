switch(allyChar) {
	case character.ladybug:
		spriteIdle = sprLadybugIdle;
	break;
	case character.snail:
		spriteIdle = sprSnailIdle;
	break;
	case character.bee:
		spriteIdle = sprBeeIdle;
	break;
	case character.ant:
		spriteIdle = sprAntIdle;
	break;
}
sprite_index = spriteIdle;

if instance_exists(target){
	playerX = target.x;
	playerY = target.y;
}

if (global.pause) {
	path_end();
	exit;
}

moveDir = (direction mod 180)*2-1;
if ( !locked ) {
	rangeX = lengthdir_x(-16,target.moveDir);
	rangeY = lengthdir_y(-16,target.moveDir);
}

if ( point_distance(x,y,nextX,nextY) < 16) {
	moveDelay = moveTimer;
} else {
	moveDelay --;
}
if ( moveDelay < 1 ||! path_index && point_distance(x,y,playerX,playerY) > 16 ) {
	var playerAngle = point_direction(x,y,playerX,playerY);
	path_delete(path);
	path = path_add();
	
	var 
	_x = ((playerX	+rangeX) div TS) * TS+8,
	_y = ((playerY-8+rangeY) div TS) * TS+8;

	var _grid = mp_grid_path(global.mp_grid,path,x,y,_x,_y,1);
	
	if _grid {
		nextX = _x;
		nextY = _y;
		moveDelay = moveTimer;
		path_start(path, spd, 0, 0);
	}
}
