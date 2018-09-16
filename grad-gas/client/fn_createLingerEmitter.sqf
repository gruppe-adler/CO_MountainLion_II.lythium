/*
	taken from grad rotor wash
	for gruppe adler by nomisum

	[position player, 300, 5] call GRAD_gas_fnc_createLingerEmitter;
*/

params ["_position", ["_lifetime", 300], ["_size",10], ["_rgb", [0.3,0.25,0.2]], ["_transparency",1]];
_rgb params ["_colorR", "_colorG", "_colorB"];

private _interval = 0.01;
private _duration = 0.1;

private _grad_linger = "#particlesource" createVehicleLocal _position;

_grad_linger setParticleCircle [_size, [0, 0, 0]];
_grad_linger setParticleParams [
		["\A3\data_f\cl_basic", 1, 0, 1],
		 "", "Billboard", 1, _lifetime, 
		 [0, 0, 0], 
		 [0, 0, 0], 0.3, 
		 1,
		 1,
		 100,
		 [11, 12, 13, 13, 13, 13, 13, 13, 14, 14, 14, 14, 15, 16], 
		 [
		 	
		 	[_colorR, _colorG, _colorB, 0],
		 	[_colorR, _colorG, _colorB, 0.3],
		 	[_colorR, _colorG, _colorB, 0.25],
		 	[_colorR, _colorG, _colorB, 0.2],
		 	[_colorR, _colorG, _colorB, 0.15],
		 	[_colorR, _colorG, _colorB, 0.14],
		 	[_colorR, _colorG, _colorB, 0.13],
		 	[_colorR, _colorG, _colorB, 0.12],
		 	[_colorR, _colorG, _colorB, 0.11],
		 	[_colorR, _colorG, _colorB, 0.10],
		 	[_colorR, _colorG, _colorB, 0.07],
		 	[_colorR, _colorG, _colorB, 0.03],
		 	[_colorR, _colorG, _colorB, 0.01],
		 	[_colorR, _colorG, _colorB, 0]
		 ], 
		 [0.08], 0, 0, "", "", _grad_linger];


_grad_linger setParticleRandom
/*LifeTime*/		[0,
/*Position*/		[_size, _size, 0],
/*MoveVelocity*/	[0,0,0],
/*rotationVel*/		0,
/*Scale*/		0.1,
/*Color*/		[0,0,0,0],
/*randDirPeriod*/	0,
/*randDirIntesity*/	0,
/*Angle*/		0];


_grad_linger setDropInterval _interval;

/* _grad_linger setParticleRandom [10, [0.25, 0.25, 0], [1, 1, 0], 1, 1, [0, 0, 0, 0.1], 0, 0];*/	
sleep _duration;

deleteVehicle _grad_linger;