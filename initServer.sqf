if (isMultiplayer) then {
	setDate [2015, 10, 06, 5, 0];
};

["Initialize", [true]] call BIS_fnc_dynamicGroups;

if (isMultiplayer) then {
	[] spawn GRAD_introCam_fnc_init;
};

{

	if (!(typeOf _x isEqualTo "B_Officer_F") && (!(side _x isEqualTo civilian))) then {
		_x setVariable ["ml_id", _forEachIndex, true];
	};

	if (!isMultiplayer && !isPlayer _x) then {
		[_chair, _x] call acex_sitting_fnc_sit;
	};

} forEach playableUnits + switchableUnits;