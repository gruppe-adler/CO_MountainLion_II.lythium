// dont display for JIP
// if (didJIP) exitWith {};
waitUntil {!isNull player};
waitUntil {time > 0};

[] spawn GRAD_introCam_fnc_textEffects;
[] call GRAD_introCam_fnc_playRecord;

private _shots = missionNamespace getVariable ["GRAD_INTROCAM_SHOTS", []];

private _count = count _shots;
{
  	[_x, _forEachIndex] call GRAD_introCam_fnc_camCommands;
} forEach _shots;


cutText [" ", "BLACK IN", 3];
private _camera = "camera" camCreate (getpos player);
_camera cameraeffect ["terminate", "back"];
camDestroy _camera;

STHud_UIMode = 1;

setViewDistance 4000;