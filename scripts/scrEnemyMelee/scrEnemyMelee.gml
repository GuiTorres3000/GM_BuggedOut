function scrEnemyMelee(){
	if ( ! atkMode ){
		atkMode = 1
		xspd = lengthdir_x(4,playerAngle);
		yspd = lengthdir_y(4,playerAngle);
		image_index = 0; 
		ds_list_clear(hitByAttack);
	}
	if atkMode < 1 exit;
	scrEnemyAtkSprite();
	xspd = lerp(xspd,0,.1);
	yspd = lerp(yspd,0,.1);
	
	if ( xspd < .2 && yspd < .2 ) { 
	var hitByAttackNow = ds_list_create();
	var hits = instance_place_list(x, y, objPlayer, hitByAttackNow, false);
	
	if (hits > 0){
		for (var i=0; i < hits; i++){
			var hitID = hitByAttackNow[| i]; 
			if (ds_list_find_index(hitByAttack, hitID) == -1){
			
				ds_list_add(hitByAttack, hitID);
				with(hitID){
					hp--;
					scrScreenshake(4,16);
				}
			}
		}
	}
	ds_list_destroy(hitByAttackNow);
	
	if(scrAnimationEnd()){
		sprite_index = sprLadybugIdle;
		image_index = image_number;
		
		xspd = 0;
		yspd = 0;
		
		attackTimer = attackCooldown;
		enemyState = enemy.walk;
		atkMode = 0;
	}
	}
}