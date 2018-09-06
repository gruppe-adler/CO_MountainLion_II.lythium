if (!isServer) exitWith {};

["GRAD_missionControl_setServerAsOwner", {
    params ["_group"];

    //make unit editable
    if([_group] isEqualTypeParams [grpNull])then{
        {
            _x addCuratorEditableObjects [units _input, true];
        } forEach (entities "moduleCurator_F");
    };
    
    _group setGroupOwner 2;
   
}] call CBA_fnc_addEventHandler;