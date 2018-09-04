private _introHeli2 = "RHS_UH60M_d" createVehicleLocal [8080.6,13585.4,127.648];

// createVehicleCrew _introHeli2;

_introHeli2 engineOn true;

[ _introHeli2, [] call GRAD_introCam_fnc_heli2 ] spawn BIS_fnc_UnitPlay;



private _introHeli = "RHS_UH60M_d" createVehicleLocal [8293.22,13342,120];

// createVehicleCrew _introHeli;

_introHeli engineOn true;

[ _introHeli, [] call GRAD_introCam_fnc_heli, [], false, nil, nil, 4 ] spawn BIS_fnc_UnitPlay;


private _introHeli3 = "RHS_UH60M_d" createVehicleLocal [8375.66,13307.5,120];

// createVehicleCrew _introHeli3;

_introHeli3 engineOn true;

[ _introHeli3, [] call GRAD_introCam_fnc_heli3, [], false, nil, nil, 18 ] spawn BIS_fnc_UnitPlay;


[_introHeli, _introHeli2, _introHeli3] spawn {
	params ["_introHeli", "_introHeli2", "_introHeli3"];

	sleep 80;

	_introHeli setvariable ["BIS_fnc_unitPlay_terminate",true];
	_introHeli2 setvariable ["BIS_fnc_unitPlay_terminate",true];
	_introHeli3 setvariable ["BIS_fnc_unitPlay_terminate",true];

	/*
	{_introHeli deleteVehicleCrew _x} forEach crew _introHeli;
	{_introHeli2 deleteVehicleCrew _x} forEach crew _introHeli2;
	{_introHeli3 deleteVehicleCrew _x} forEach crew _introHeli3;
	*/

	deleteVehicle _introHeli;
	deleteVehicle _introHeli2;
	deleteVehicle _introHeli3;

};