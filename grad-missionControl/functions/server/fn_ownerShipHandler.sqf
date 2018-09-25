if (!isServer) exitWith {};

["GRAD_missionControl_setServerAsOwner", {
    params ["_group"];

    //make unit editable for all zeus
    if([_group] isEqualTypeParams [grpNull])then{
        {
            _x addCuratorEditableObjects [units _group, true];
        } forEach (entities "moduleCurator_F");
    };

    
    // store loadout in variable to reapply if loadout bug kicks in
    {
      	_x setVariable ["GRAD_missionControl_loadoutCache", getUnitLoadout _x];
    } forEach units _group;


    // change owner to server
    _group setGroupOwner 2;


    // reapply loadiout if necessary
   	[{
   		params ["_group"];

    	{
    		if ((uniform _x) isEqualTo "") then {
    			_x setUnitLoadout (_x getVariable ["GRAD_missionControl_loadoutCache", typeOf _x]); // you can also setunitloadout class as a fallback
    		};
    	} forEach units _group;
    }, [_group], 3] call CBA_fnc_waitAndExecute;
   
}] call CBA_fnc_addEventHandler;