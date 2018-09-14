params ["_obj"];

_obj removeAllEventHandlers "Explosion";
[_obj,10, false,true] execVM "AL_bomb\alias_bomb_ini.sqf";
deleteVehicle _obj;

missionNamespace setVariable ["grad_gas_leakClosed", true, true];