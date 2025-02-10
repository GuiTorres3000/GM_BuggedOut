function scrEnemyIdle(){
	if point_distance(x,y,playerX,playerY) < 96 &&! collision_line(x,y,playerX,playerY,objWall,0,0){
		enemyState = enemy.walk;
	}
}