#region Controlls
	rightKey = keyboard_check(ord("D"));
	leftKey = keyboard_check(ord("A"));
	upKey = keyboard_check(ord("W"));
	downKey = keyboard_check(ord("S"));
	changeKey = keyboard_check_released(ord("X"));
	
	attackKey = mouse_check_button(mb_left)


	move = (rightKey || leftKey || upKey || downKey);
#endregion 
depth = -y;
#region Movement

if global.pause {
	xspd = 0;
	yspd = 0;
	exit;
}

switch(playerStates){
	
	case state.idle:
		#region Idle
		
		spd = 0;
		
		// State Walk
		if(move) playerStates = state.walk;
		
		// State Attack
		if (attackTimer > 0) attackTimer--;
		if(attackTimer <= 0 && attackKey) playerStates = state.attack;

		#endregion
	break;
	
	case state.walk:
		#region Walk
		
		// Movement
		var result = scrWalk(rightKey, leftKey, downKey, upKey, spd, maxspd, moveDir, moveBoth);
		moveDir = result[0];
		moveBoth = result[1];
		spd = result[2];
		
		// State Idle
		if(!move) playerStates = state.idle;
		
		// State Attack
		if (attackTimer > 0) attackTimer--;
		if(attackTimer <= 0 && attackKey) playerStates = state.attack;
		
		#endregion
	break;
	
	case state.attack:
		#region Attack
			scrAttack();
		#endregion
	break;
}


if (!global.pause){
	// Aplicar velocidade
	xspd = lengthdir_x(spd * moveBoth, moveDir);
	yspd = lengthdir_y(spd * moveBoth, moveDir);
}
#endregion

#region Change Player

if (changeKey){
	
	var old_player_char = playerChar; // Armazena o personagem atual para trocar depois
    var target_ally; // Variável para armazenar o aliado alvo
	
	switch(playerChar) {
		case character.ladybug:
			spriteIdle = sprSnailIdle;
			spriteWalk = sprSnailIdle;
			spriteWalkBack = sprSnailIdle;
			playerChar = character.snail;
			target_ally = ally_snail;
	    break;
		case character.snail:
			spriteIdle = sprBeeIdle;
			spriteWalk = sprBeeIdle;
			spriteWalkBack = sprBeeIdle;
			playerChar = character.bee;
			target_ally = ally_bee;
		break;
		case character.bee:
			spriteIdle = sprAntIdle;
			spriteWalk = sprAntIdle;
			spriteWalkBack = sprAntIdle;
			playerChar = character.ant;
			target_ally = ally_ant;
		break;
		case character.ant:
			spriteIdle = sprLadybugIdle;
			spriteWalk = sprLadybugWalk;
			spriteWalkBack = sprLadybugIdle;
			playerChar = character.ladybug;
			target_ally = ally_ladybug;
	    break;
    }
	
	// Trocar de posição com o aliado correspondente
    var temp_x = x;
    var temp_y = y;

    target_ally.x = temp_x;
    target_ally.y = temp_y;

    x = target_ally.x;
    y = target_ally.y;
	
    // Trocar os IDs dos personagens
    target_ally.allyChar = old_player_char;

    // Atualizar a referência do aliado atual
    if (old_player_char == character.ladybug) {
        ally_ladybug = target_ally;
    } else if (old_player_char == character.snail) {
        ally_snail = target_ally;
	} else if (old_player_char == character.bee) {
		ally_bee = target_ally;
    } else if (old_player_char == character.ant) {
        ally_ant = target_ally;
    }
}

#endregion

#region Animation
if (playerStates != state.attack){
	if (moveBoth != 0){
		if((spriteDir && leftKey) || (!spriteDir && rightKey)) sprite_index = spriteWalkBack;
		else sprite_index = spriteWalk;
	} else{
		sprite_index = spriteIdle;	
	}
}
#endregion