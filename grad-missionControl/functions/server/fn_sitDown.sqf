params ["_unit"];

private _group = group _unit;

[
 _unit,
 "SIT_LOW",
 "ASIS", {combatMode (group _this) isEqualTo "AWARE"}
] call BIS_fnc_ambientAnimCombat;