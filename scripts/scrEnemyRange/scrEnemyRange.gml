function scrEnemyRange(){
	path_end();
	sprite_index = spriteAttack;
	if ( attackTimer > -5 ) exit;
	
	var bullet = instance_create_depth(x,y-8,depth-1,objEnemyBullet);
	bullet.speed = 4;
	bullet.sprite_index = sprBullet;
	bullet.direction = playerAngle;
	
	sprite_index = sprLadybugIdle;
	enemyState = enemy.walk;
	attackTimer = attackCooldown;
}