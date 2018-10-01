params ["_index", "_pos", "_radius", "_angle", "_speed"];


private _vector = [(sin _angle*_speed),(cos _angle*_speed), 0];

private _gasClouds = [_pos, _radius, _angle] call GRAD_gas_fnc_gasCloudsCreate;
private _gasLeak = [_pos, _vector, _angle] call GRAD_gas_fnc_gasLeakCreate;

private _soundSource = "Sign_Sphere25cm_F" createVehicleLocal _pos;
_soundSource setObjectTexture [0, "#(argb,8,8,3)color(0,0,0,0,ca)"];


// loop sound
[{
    params ["_args", "_handle"];
    _args params ["_index", "_soundSource"];

    
    if (missionNamespace getVariable [_index, false]) exitWith {
    	[_handle] call CBA_fnc_removePerFrameHandler;
    };

    if (!isNull _soundSource) then {
        _soundSource say3D ["steam", 30];
    };

},4.05,[_index, soundSource]] call CBA_fnc_addPerFrameHandler;

// delete sound + effects
[{
     params ["_args", "_handle"];
    _args params ["_index", "_soundSource", "_gasLeak", "_gasClouds"];

    if (missionNamespace getVariable [_index, false]) exitWith {
        deleteVehicle _soundSource;
        deleteVehicle _gasLeak;
        deleteVehicle _gasClouds;
    };

},0.5,[_index, _soundSource, _gasLeak, _gasClouds]] call CBA_fnc_addPerFrameHandler;