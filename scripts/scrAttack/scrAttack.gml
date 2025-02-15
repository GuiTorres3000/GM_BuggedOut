// @function
function scrAttack(){
	
	if (!attacking){
		var mouseDir = point_direction(x, y, mouse_x, mouse_y)
		if((mouseDir > 0 && mouseDir < 45) || (mouseDir > 315 && mouseDir < 360)){
			sprite_index = spriteAttack0[0];
			image_index = 0;
			mask_index = spriteAttack0HB;
			moveDir = 0;
		}else if(mouseDir > 45 && mouseDir < 135){
			sprite_index = spriteAttack90[0];
			image_index = 0;
			mask_index = spriteAttack90HB;
			moveDir = 90;
		}else if(mouseDir > 135 && mouseDir < 225){
			sprite_index = spriteAttack0[0];
			image_index = 0;
			mask_index = spriteAttack0HB;
			moveDir = 180;
		}else if(mouseDir > 225 && mouseDir < 315){
			sprite_index = spriteAttack270[0];
			image_index = 0;
			mask_index = spriteAttack270HB;
			moveDir = 270;
		}
		moveBoth = 1;
		ds_list_clear(hitByAttack);
		attacking = true;
		spd = 2;
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
	
	if(mouse_check_button_pressed(mb_left) && (image_index > 2)){
		attacking = false;
		playerStates = state.attack_combo;
	}
	
	if(scrAnimationEnd()){
		sprite_index = sprLadybugPreparation;
		mask_index = sprPlayer;
		attackTimer = attackCooldown;
		attacking = false;
		playerStates = state.walk;
	}
	
	return [moveDir];
}