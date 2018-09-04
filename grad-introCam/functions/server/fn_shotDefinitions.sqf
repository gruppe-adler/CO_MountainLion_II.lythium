// "_campos1", "_campos2", "_target", "_duration", "_zoom1", "_zoom2", "_isAttached", ["_offset",[0,0,0]],  "_radius"


/*
	
	CAM TYPES:

	["FREE", pos1, pos2, target, duration, fov1, fov2, offset (optional)],
	["ATTACHED", pos1, pos2, target, duration, fov1, fov2, offset (optional)],
	["ROTATE", angleStart, angleEnd, target, duration, fov1, fov2, radius (int), cclockwise (bool)]

*/

if (!isServer) exitWith {};

private _definitions = [
	["FREE", getPos intro_camPos1, getPos intro_camPos2, intro_camTarget, intro_camTarget, 63.4, 0.4, 0.6, [0,0,20], [0,0,20]],
	["FREE", getPos intro_camPos2, getPos intro_end, intro_camTarget, intro_billboard, 20, 0.6, 0.2, [0,0,20], [0,0,1]],
	["FREE", getPos intro_end, getPos intro_end, intro_billboard, intro_billboard, 3, 0.2, 0.3, [0,0,1], [0,0,3]],
	["FREE", getPos intro_end, getPos intro_end2, intro_billboard, intro_billboard, 10, 0.3, 0.4, [0,0,3], [0,0,4]]
];

/////// dont edit below

{
  	[_x] call GRAD_introCam_fnc_addShot;
} forEach _definitions;