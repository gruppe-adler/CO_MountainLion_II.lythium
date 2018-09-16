/*
    rewritten version of aliascartoons jdam 

    [cursorObject, 10, false] call GRAD_gas_fnc_explosionServer;
*/

params ["_obj", ["_radius",10], ["_deleteEverything",false]];

private _destructionCenter = [];

if (typeName _obj isEqualTo "OBJECT") then {
    _destructionCenter = position _obj;
} else {
    _destructionCenter = _obj;
};

_obj removeAllEventHandlers "Explosion";

missionNamespace setVariable ["grad_gas_leakClosed", true, true];



private _secondary = "ammo_Missile_Cruise_01" createVehicle _destructionCenter;
_secondary setDamage 1;

/*
destroy nearest things / throw them in the air
*/
[_destructionCenter, _radius] remoteExec ["GRAD_gas_fnc_explosionClient", [0,-2] select isDedicated];

[_destructionCenter, _radius, _deleteEverything] spawn {
    params ["_destructionCenter", "_radius", "_deleteEverything"];

    private _vegetation = nearestTerrainObjects [_destructionCenter, ["TREE","SMALL TREE","BUSH"],2*_radius];
    private _buildings = _destructionCenter nearObjects ["building",1.5*_radius];
    private _things = _destructionCenter nearObjects ["Thing",3*_radius];
    private _cars = _destructionCenter nearObjects ["car",1.5*_radius];
    private _men = _destructionCenter nearObjects ["man",1.5*_radius];
    private _menAndCars = _men + _cars;

    {   
        
        if (random 1 > 0.8) then {
                [_x, [0,0,0], 300 + random 50, .0005, .5] remoteExec ["GRAD_gas_fnc_createFire", [0,-2] select isDedicated];
            
                _x setVelocity [random 10-random 20,random 10-random 20,30+random 10]; 
                _x setdamage 1;
            
        } else {
            deleteVehicle _x;
        };
        sleep 0.01;
    } foreach _things;

    {   
        _x setVelocity [random 5-random 10,random 5-random 10,15+random 15]; 
        /*[_x, 0.9, "body", "explosive"] call ace_medical_fnc_addDamageToUnit;*/
        [_x, true] call ace_medical_fnc_setUnconscious;
        sleep 0.01
    } foreach _menAndCars;

    if (_deleteEverything) then {
        {
            _x setDamage 1; 
            hideObjectGlobal _x; 
            sleep 0.01; 
        } foreach _buildings;       
    } else {
        {
            _x setDamage 1; 
            sleep 0.01
        } foreach _buildings;   
    };    

    {_x setDamage 1;} foreach _vegetation;

    "test_EmptyObjectForFireBig" createVehicle _destructionCenter;
};