function scrEnemyAtkSprite(){
	var _atk, _hb;
	switch(floor((playerAngle+45)/90)){
		default:
			_atk = spriteAttack0;
			_hb  = spriteAttack0HB;
			break
		case 1:
			_atk = spriteAttack90;
			_hb  = spriteAttack90HB;
			break
		case 2:
			_atk = spriteAttack0;
			_hb  = spriteAttack0HB;
			break
		case 3:
			_atk = spriteAttack270;
			_hb  = spriteAttack270HB;
			break
	}
	
	sprite_index = _atk;
	mask_index	 = _hb;
}