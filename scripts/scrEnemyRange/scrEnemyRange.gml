function scrEnemyRange(){
	sprite_index = spriteAttack;
	
	var bullet = instance_create_depth(x,y-8,depth-1,objEnemyBullet);
	bullet.speed = 4;
	bullet.sprite_index = sprBullet;
	bullet.direction = playerAngle;
	
	sprite_index = sprLadybugIdle;
	enemyState = enemy.walk;
	attackTimer = attackCooldown;
}