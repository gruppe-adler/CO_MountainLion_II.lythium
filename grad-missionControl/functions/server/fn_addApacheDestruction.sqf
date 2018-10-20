params ["_unit"];

_unit addEventHandler ["HandleDamage", {
    params ["_unit", "_selection", "_damage", "_source", "_projectile", "_hitIndex", "_instigator", "_hitPoint"];

    if ((typeOf (vehicle _source)) == "RHS_AH64D_wd") then {

        _unit setVariable ["ML_isVaporized", true];
        _unit removeAllEventHandlers "HandleDamage";
        private _position = getPos _unit;
        deleteVehicle _unit;
        // systemChat "unit deleted";
        [_position] remoteExec ["GRAD_missionControl_fnc_createBloodEffect", [0,-2] select isDedicated];
    };

}];

_unit addEventHandler ["Killed", {
    params ["_unit", "_source", "_damage", "_instigator"];

    if (!(_unit getVariable ["ML_isVaporized", false])) then {
        private _intel = "";

        if (random 10 > 9.5) then {

            private _currentIntelCount = missionNamespace getVariable ["ML_intelCount", 0];
            missionNamespace setVariable ["ML_intelCount", _currentIntelCount + 1, true];
            _intel = selectRandom ["<img image='pic\intel_i.jpg' />", "<img image='pic\intel_ii.jpg' />", "<img image='pic\intel_iii.jpg' />"];

            diag_log format ["adding intel number %1", (_currentIntelCount + 1)];
        };

        [_unit, _intel, 5] call GRAD_missionControl_fnc_addIntel;
    };

}];