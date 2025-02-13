/// @desc scrScreenshake(shakeFrames, shakeStrenght)
function scrScreenshake(){
	if (instance_exists(global.instCamera)){
		with(global.instCamera){
			if (argument0 > shake){
				shakeStrenght = argument0;
				shake = shakeStrenght;
				shakeFrames = argument1;
			}
		}
	}
}