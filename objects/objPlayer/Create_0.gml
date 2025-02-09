// Velocidade
maxspd = 1;		// Velocidade Máxima

spd = 0;
xspd = 0;		
yspd = 0;

move = false;	// Se o player está em movimento
moveDir = 0;	// Direção em graus do angulo movimento
moveBoth = 0;	// Se o player está movendo duas teclas ao mesmo tempo, pare 

// Controles
rightKey = 0;
leftKey = 0;
upKey = 0;
downKey = 0;

changeKey = 0;

// Estado 
playerStates = state.idle;

enum state{
	idle,
	walk,
	dash,
	hit
}

// Estado 
playerChar = character.ladybug;

enum character{
	ladybug,
	snail,
	bee,
	ant
}

ally_ladybug = id;

ally_snail = instance_create_layer(x + 50, y, "Instances", objAlly); 
ally_snail.allyChar = character.snail;

ally_bee = instance_create_layer(x - 50, y, "Instances", objAlly); 
ally_bee.allyChar = character.bee

ally_ant = instance_create_layer(x, y -50, "Instances", objAlly); 
ally_ant.allyChar = character.ant


// Sprites
spriteIdle = sprLadybugIdle;
spriteWalk = sprLadybugIdle;
spriteWalkBack = sprLadybugIdle;
spriteDash = sprLadybugIdle;

sprite = sprLadybugIdle;
spriteDir = 1; // Direção do Sprite