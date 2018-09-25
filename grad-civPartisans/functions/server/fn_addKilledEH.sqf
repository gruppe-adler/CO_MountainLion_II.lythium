params ["_unit"];

_unit addEventHandler ["Killed", {
    params ["_unit", "_source", "_damage", "_instigator"];

    private _currentDeadCivsCount = missionNamespace getVariable ["ML_deadcivCount", 0];
    missionNamespace setVariable ["ML_deadcivCount", _currentDeadCivsCount + 1, true];

    diag_log format ["civ killed number %1", (_currentDeadCivsCount + 1)];

}];