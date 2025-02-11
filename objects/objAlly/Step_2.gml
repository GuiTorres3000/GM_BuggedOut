var player = instance_find(objPlayer, 0); // Encontra a primeira instância de objPlayer
if (player != noone &&! locked) {
    x = player.posX[record]; 
    y = player.posY[record];
}