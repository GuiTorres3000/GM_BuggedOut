if instance_exists(objPlayer){
	playerX = instance_nearest(x,y,objPlayer).x;
	playerY = instance_nearest(x,y,objPlayer).y;
}

if (global.pause) {
	path_end();
	exit;
}
attackTimer	--;
playerAngle = point_direction(x,y-8,playerX,playerY-8);

switch(enemyState){
	case enemy.idle: scrEnemyIdle(); break
	case enemy.walk: scrEnemyWalk(); break
	case enemy.atk : scrEnemyAtk();  break
	case enemy.hit : scrEnemyHit();  break
}

if (hp < 1 ) instance_destroy();