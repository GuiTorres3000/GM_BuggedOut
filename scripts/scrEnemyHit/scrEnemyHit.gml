function scrEnemyHit(){
	path_end();
	xspd = lerp(xspd,0,.1);
	yspd = lerp(yspd,0,.1);
	if ( abs(xspd) < .1 && abs(yspd) < .1 ) {
		xspd = 0;
		yspd = 0;
		enemyState = enemy.walk;
	}
}