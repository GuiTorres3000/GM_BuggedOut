// @function
function scrAttackCombo(){
	
	if (!attacking){
		if(moveDir == 0){
			sprite_index = spriteAttack0[1];
			image_index = 0;
			mask_index = spriteAttack0HB;
		}else if(moveDir == 90){
			sprite_index = spriteAttack90[1];
			image_index = 0;
			mask_index = spriteAttack90HB;
		}else if(moveDir == 180){
			sprite_index = spriteAttack0[1];
			image_index = 0;
			mask_index = spriteAttack0HB;
		}else if(moveDir == 270){
			sprite_index = spriteAttack270[1];
			image_index = 0;
			mask_index = spriteAttack270HB;
		}
		moveBoth = 1;
		ds_list_clear(hitByAttack);
		attacking = true;
		spd = 1;
	}
	var hitByAttackNow = ds_list_create();
	var hits = instance_place_list(x, y, objEnemy, hitByAttackNow, false);
	
	if (hits > 0){
		for (var i=0; i < hits; i++){
			var hitID = hitByAttackNow[| i]; 
			if (ds_list_find_index(hitByAttack, hitID) == -1){
			
				ds_list_add(hitByAttack, hitID);
				with(hitID){
					hp--;
					xspd = lengthdir_x(3,playerAngle-180);
					yspd = lengthdir_y(3,playerAngle-180);
					enemyState = enemy.hit;
					scrScreenshake(4,16);
				}
			}
		}
	}
	ds_list_destroy(hitByAttackNow);
	
	spd = lerp(spd, 0, 0.1);
	if(scrAnimationEnd()){
		sprite_index = sprLadybugIdle;
		mask_index = sprPlayer;
		playerStates = state.walk;
		attackTimer = attackCooldown;
		attacking = false;
	}
	
	return [spd];
}