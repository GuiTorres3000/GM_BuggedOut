switch(allyChar) {
	case character.ladybug:
		spriteIdle = sprLadybugIdle;
		spriteWalk = sprLadybugWalk;
	break;
	case character.snail:
		spriteIdle = sprSnailIdle;
		spriteWalk = sprLadybugWalk;
	break;
	case character.bee:
		spriteIdle = sprBeeIdle;
		spriteWalk = sprLadybugWalk;
	break;
	case character.ant:
		spriteIdle = sprAntIdle;
		spriteWalk = sprLadybugWalk;
	break;
}

if instance_exists(objPlayer){
	playerX = objPlayer.x;
	playerY = objPlayer.y;
}