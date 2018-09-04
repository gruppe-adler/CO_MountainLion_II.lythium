/*

	by nomisum for gruppe adler 2018


	[position this, 35, this, "Sheep_random_F"] call GRAD_herding_fnc_create;
*/



params ["_spawnPosition", ["_count",10], ["_shepherd", objNull], ["_animalType", "Goat_random_F"]];

// get amount of herds created and add to counter
private _currentIndex = (missionNamespace getVariable ["GRAD_herding_instanceCount", -1]) + 1;
missionNamespace setVariable ["GRAD_herding_instanceCount", _currentIndex, true];

private _herdArray = [_shepherd, objNull, [], []];
private _herdAnimals = [];


[] remoteExec ["GRAD_herding_fnc_addGestureHandler", _shepherd];


if (!isNull _shepherd) then {
	
	private _pole = "Land_Net_Fence_pole_F" createVehicle [0,0,0];
	_pole attachTo [_shepherd, [0,0,0], "RightHandMiddle1"];
	_pole setVectorDirAndUp [[0,0.66,-0.33],[0,0.33,0.66]];
	_shepherd setVariable ["shepherdPole", _pole, true];


	_shepherd addEventHandler ["killed", {
		params ["_unit"];

		detach (_unit getVariable ["shepherdPole", objNull]);
	}];
};


for "_i" from 1 to _count do {

		// Spawn animal
		private _animal = createAgent [_animalType, _spawnPosition, [], 0, "NONE"];

		// Disable animal behaviour
		_animal setVariable ["BIS_fnc_animalBehaviour_disable", true];
		_animal disableAI "FSM";
		// _animal disableAI "MOVE";
		// _animal disableAI "ANIM";
		_animal setBehaviour "CARELESS";
		_animal setCombatMode "RED";
		// _animal setSkill 0;

		// Declare first animal to leader of flock
		if (_i isEqualTo 1) then {
				_animal setDir (random 360);
				_herdArray set [1, _animal];

				[_animal, _currentIndex] call GRAD_herding_fnc_addEventhandler;
		} else {
				_animal setDir (_animal getRelDir (_herdArray select 1));
						
				// Add animal to animal list
				_herdAnimals pushBack _animal;
		};
};

// fill herd with animal array
_herdArray set [2, _herdAnimals];


// save herd index to make it globally und publicly accessible 
private _instanceString = format ["GRAD_herding_instance_%1", _currentIndex];
missionNamespace setVariable [_instanceString, _herdArray, true];

diag_log format ["_currentIndex %1, _instanceString %2", _currentIndex, _instanceString];

[_currentIndex] spawn GRAD_herding_fnc_loop;

diag_log format ["created herd %1", _herdArray];

_herdArray