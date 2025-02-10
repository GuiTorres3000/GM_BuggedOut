// @function
function scrAttack(){
	
	if (sprite_index != spriteAttack){
		sprite_index = spriteAttack	
		image_index = 0; 
		ds_list_clear(hitByAttack);
	}
	mask_index = sprLadybugAttackHitbox;
	var hitByAttackNow = ds_list_create();
	var hits = instance_place_list(x, y, objEnemy, hitByAttackNow, false);
	
	if (hits > 0){
		for (var i=0; i < hits; i++){
			var hitID = hitByAttackNow[| i]; 
			if (ds_list_find_index(hitByAttack, hitID) == -1){
			
				ds_list_add(hitByAttack, hitID);
				with(hitID){
					hp--;
				}
			}
		}
	}
	ds_list_destroy(hitByAttackNow);
	mask_index = sprPlayer;
	
	if(scrAnimationEnd()){
		sprite_index = sprLadybugIdle;
		playerStates = state.idle;
		attackTimer = attackCooldown;
	}
	
	spd = 0;
	
	return [spd];
}