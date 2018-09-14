params ["_obj"];

_obj removeAllEventHandlers "Explosion";
[_obj,10, true,true] execVM "AL_bomb\alias_bomb_ini.sqf";
deleteVehicle _obj;