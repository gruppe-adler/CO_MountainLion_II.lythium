/*

	by nomisum for gruppe adler 2018

	// object, leak starts instantly, has action to start leak, distance of effect, angle + speed of leak, offset to object position
	[this, true, true, [false, false], 10, 270, 1, [0,0,0]] call GRAD_gas_fnc_gasLeakAdd;

*/

params [
	"_obj", 
	["_startsOpen", true],
	["_hasAction", false],
	["_removeOnCompletion", [false, false]],
	["_distance",10],
	["_angle", 0], 
	["_speed", 1], 
	["_offset", [0,0,0]],
	["_openLeakString", "Open Valve"],
	["_closeLeakString", "Close Valve"],
	["_actionDuration", 5]
];

_removeOnCompletion params ["_removeOnOpen", "_removeOnClose"];


private _leakIdentifier = [] call GRAD_gas_fnc_gasLeakGenerateIdentifier;
private _pos = [_obj, _offset] call GRAD_gas_fnc_gasLeakGetPos;


if (_startsOpen) then {
	[_leakIdentifier, _pos, _distance/2, _angle, _speed] call GRAD_gas_fnc_gasLeakEffectsAmbient;
	[_leakIdentifier, _pos, _distance/2, _angle, _speed] call GRAD_gas_fnc_gasLeakEffectsPlayer;
};

if (_hasAction) then {
	[_leakIdentifier, _obj, _actionDuration, _closeLeakString, _startsOpen, _removeOnOpen, _removeOnClose] call GRAD_gas_fnc_addAction;
};