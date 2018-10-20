params ["_unit"];

_unit addEventHandler ["Killed", {
    params ["_unit", "_source", "_damage", "_instigator"];

    private _currentDeadCivsCount = ((missionNamespace getVariable ["ML_deadcivCount", 0]) + 1);
    missionNamespace setVariable ["ML_deadcivCount", _currentDeadCivsCount, true];

    diag_log format ["civ killed number %1", _currentDeadCivsCount];

    private _allCuratorUnits = [];
    {
        _allCuratorUnits pushback (getAssignedCuratorUnit _x);
    } forEach allCurators;

    [format ["civ killed number %1", _currentDeadCivsCount]] remoteExec ["systemChat", _allCuratorUnits, true];


}];