params ["_unit"];

_unit addEventHandler ["HandleDamage", {
    params ["_unit", "_selection", "_damage", "_source", "_projectile", "_hitIndex", "_instigator", "_hitPoint"];

    if ((typeOf (vehicle _source)) == "RHS_AH64D_wd") then {

        _unit removeAllEventHandlers "HandleDamage";
        private _position = getPos _unit;
        deleteVehicle _unit;
        // systemChat "unit deleted";
        [_position] remoteExec ["GRAD_missionControl_fnc_createBloodEffect", [0,-2] select isDedicated];
    };

}];