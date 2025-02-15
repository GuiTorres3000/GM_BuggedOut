// @function
function scrAttack(){
	
	if (!attacking){
		var mouseDir = point_direction(x, y, mouse_x, mouse_y)
		moveDir = mouseDir;
		switch(floor((mouseDir+45)/90)){
			case 0:
			case 4:
				sprite_index = spriteAttack0[0];
				image_index = 0;
				mask_index = spriteAttack0HB;
			break;
			case 1:
				sprite_index = spriteAttack90[0];
				image_index = 0;
				mask_index = spriteAttack90HB;
			break;
			case 2:
				sprite_index = spriteAttack0[0];
				image_index = 0;
				mask_index = spriteAttack0HB;
			break;
			case 3:
				sprite_index = spriteAttack270[0];
				image_index = 0;
				mask_index = spriteAttack270HB;
			break;
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
	
	return;
}