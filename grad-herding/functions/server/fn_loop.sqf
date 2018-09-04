params ["_index"];

diag_log format ["starting loop for herd %1", _index];

/*private _targetDebug = "VR_3DSelector_01_incomplete_F" createVehicleLocal [0,0,0];
private _targetDebug2 = "VR_3DSelector_01_default_F" createVehicleLocal [0,0,0];*/

[{
	params ["_args", "_handle"];
    _args params ["_index"];

	// save herd index to make it globally und publicly accessible 
	private _instanceString = format ["GRAD_herding_instance_%1", _index];
	// diag_log format ["_instanceString is %1", _instanceString];

	private _herdArray = missionNamespace getVariable [_instanceString, []];
	_herdArray params ["_shepherd", "_leadanimal", "_animalArrayLiving", "_animalArrayDead"];

	// diag_log format ["reading herd %1 of index %2 in loop", _herdArray, _index];

	// _herdArray = [_shepherd, _leadanimal, [_animal1, _animal2,...]]

	// stop loop if all animals are dead
	if (count _animalArrayLiving isEqualTo 0) exitWith {
			[_handle] call CBA_fnc_removePerFrameHandler;
			diag_log format ["herd %1 is dead, ending loop", _index];
	};

	// change lead animal if necessary
	if (!alive _leadAnimal) then {
			private _newLeader = selectRandom _animalArrayLiving;
			_herdArray set [0, _newLeader];
			missionNamespace setVariable [_instanceString, _herdArray, true];
	};


	// target wp
	private _targetPos = [0,0,0];
	private _panicState = format ["GRAD_herding_instance_%2_panicState", _index];
	private _herdInPanic = missionNamespace getVariable [_panicState, false];

	// handle things differently depending on state of panic / shepherd
	if (_herdInPanic) then {
			_targetPos = [_leadanimal] call GRAD_herding_fnc_getWaypointInPanic;
	} else {
			if (alive _shepherd) then {
				_targetPos = [_shepherd] call GRAD_herding_fnc_getWaypointFromShepherd;
			} else {
				_targetPos = [_shepherd] call GRAD_herding_fnc_getRandomWaypoint;
			};
	};

	// _targetDebug setPos _targetPos;

	private _count = count (_animalArrayLiving + [_leadanimal]);
	// animations and move command
	
	{	
		if (!alive _x) exitWith {
				[_x, _index] call GRAD_herding_fnc_removeAnimalFromHerd;
		};

		private _distance = _x distance _targetPos;

		[{
			params ["_animal", "_distance", "_targetPos"];

			[_animal, _distance, _targetPos] call GRAD_herding_fnc_moveAnimal;
			[_animal] call GRAD_herding_fnc_makeSound;

		}, [_x, _distance, _targetPos], random 2] call CBA_fnc_waitAndExecute;
	 
	} forEach _animalArrayLiving + [_leadanimal];


}, 3, [_index]] call CBA_fnc_addPerFrameHandler;