function scrEnemyWalk(){
	if ( point_distance(x,y,playerX,playerY) < 32 ) {
		moveDelay = moveTimer;
	} else {
		moveDelay --;
	}
	if ( moveDelay < 1 ||! path_index) {
		var playerAngle = point_direction(x,y,playerX,playerY);
		path_delete(path);
		path = path_add();
	
		var 
		_x = ((playerX	+lengthdir_x(range,playerAngle+angleMod)) div TS) * TS+8,
		_y = ((playerY-8+lengthdir_y(range,playerAngle+angleMod)) div TS) * TS+8;
	
		if collision_line(_x,_y,playerX,playerY,objWall,false,false) || point_distance(x,y,_x,_y) < 16 { angleMod *= -1;
		}
	
		var _grid = mp_grid_path(global.mp_grid,path,x,y,_x,_y,1);
	
		if _grid {
			nextX = _x;
			nextY = _y;
			moveDelay = moveTimer;
			path_start(path, spd, 0, 0);
		}
	}
		
	if collision_line(x,y,playerX,playerY,objWall,0,0){
		path_end();
		enemyState = enemy.idle;
	}
}