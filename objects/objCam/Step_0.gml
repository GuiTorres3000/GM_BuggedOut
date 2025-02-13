/// @desc Atualizar Camera

// Garantir que player existe para guardar as posições dele;
if (instance_exists(follow)){
	xTo = follow.x;
	yTo = follow.y;
}

// Posição da camera
x += (xTo - x) / 15;
y += (yTo - y) / 15;

// Camera dentro da sala
x = clamp(x, viewWHalf, room_width - viewWHalf);
y = clamp(y, viewHHalf, room_height - viewHHalf);

// Screenshake
x += random_range(-shake, shake);
y += random_range(-shake, shake);

shake = max(0, shake - ((1/shakeFrames) * shakeStrenght));

camera_set_view_pos(cam, x - viewWHalf, y - viewHHalf);