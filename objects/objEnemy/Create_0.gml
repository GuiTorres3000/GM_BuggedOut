randomize();
path = path_add();
moveDelay = 60;
moveTimer = 60+irandom(30); 

xspd = 0;
yspd = 0;

playerX = 0;
playerY = 0;

nextX = 0;
nextY = 0;

sinTimer = 0;

playerAngle = 0;
angleMod = 135*choose(1,-1)*random_range(0.8,1.2);

_name = 2;

switch(_name){
	default:
		atk = scrEnemyMelee;
		range = 48;
		attackCooldown  = 60;
		spd = 1;
		break
	case 1:
		range = 80;
		atk = scrEnemyRange;
		attackCooldown  = 30;
		spd = 1;
		break
	case 2:
		range = 0;
		atk = scrEnemyMelee;
		attackCooldown  = 600;
		spd = 0;
		break
}

// Life
maxhp = irandom_range(2, 5);
hp = maxhp;

//atk
attackTimer		= attackCooldown;
hitByAttack		= ds_list_create();
atkMode = 0;
xspd = 0;
yspd = 0;

//sprites
spriteIdle = sprLadybugIdle;
spriteWalk = sprLadybugWalk;
spriteWalkBack = sprLadybugWalk;
spriteAttack = sprLadybugAttack;
spriteDash = sprLadybugIdle;

sprite = sprLadybugIdle;
spriteDir = 1; // Direção do Sprite

enum enemy{
	idle,
	walk,
	atk,
	hit
}
enemyState = enemy.idle;