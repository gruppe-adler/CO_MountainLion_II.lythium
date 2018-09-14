// by ALIAS

if (!hasInterface) exitWith {};

_obj = _this select 0;
_radius = _this select 1;
_damage_inflicted_surround = _this select 2;

[_obj,_radius,_damage_inflicted_surround] spawn 
{
	_obje = _this select 0;
	_radiux = _this select 1;
	_dam = _this select 2;
	while {!isNull _obje} do 
	{
		if((player distance _obje) < _radiux+1) then 
		{
			enableCamShake true;
			addCamShake [5,1,17];
			player setdammage (getdammage player+_dam);
			playsound "burned";
		};
		_obje say3d ["furnal",1000];
		enableCamShake false;
		sleep 3.5;
	};
};

_lite= [_obj,_radius] spawn 
{
	private ["_radiust"];
	_objt = _this select 0;
	_radiust = _this select 1;
	_luminafoc = "#lightpoint" createVehicleLocal ([1,1,1]); 
	_luminafoc lightAttachObject [_objt, [0,0,10]];
	_luminafoc setLightBrightness 10;
	_luminafoc setLightAmbient [1,0.1,0];
	_luminafoc setLightColor [1,0,0];
	_luminafoc setLightDayLight true;
	_lum=50;
	while {_lum>0} do 
	{
		_luminafoc setLightBrightness 10;
		_luminafoc setLightAttenuation [_radiust/2,20,20,0,_radiust+random 100,500];
		_lum = _lum-0.1;
		sleep 0.1;
	};
	_lum = 10;
	for "_i" from 1 to 100 do
	{
		_luminafoc setLightBrightness _lum;
		_luminafoc setLightAttenuation [_radiust/2,20,20,0,_radiust+100,500];
		sleep 0.1;
		_lum = _lum-0.1;
	};
	deletevehicle _luminafoc;
};

_fum = "#particlesource" createVehicleLocal (getPosATL _obj);
_fum setParticleCircle [_radius/2, [0,0,0]];
_fum setParticleRandom [10,[_radius/3,_radius/3,40],[-2,-2,10],2,0.5,[0,0,0,0.1],1,0.3];
_fum setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal_02.p3d",8,0,40,1], "", "Billboard",1,30,[0,0,0],[0,0,0],3,8,7,0.5,[_radius/3,_radius/2,_radius,_radius*2],[[0.5,0.5,0.5,0.5],[0.349,0.231,0.122,0.4],[0.349,0.231,0.122,0.1],[0,0,0,0]],[0.5],1,0, "", "",_obj];
_fum setDropInterval 0.01;

_caldura = "#particlesource" createVehicleLocal (getPosATL _obj);
_caldura setParticleCircle [_radius/2, [0, 0, 0]];
_caldura setParticleRandom [0,[0.25, 0.25, 0], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
_caldura setParticleParams [["\A3\data_f\ParticleEffects\Universal\Refract.p3d", 1, 0, 1], "", "Billboard", 1, 7,[0,0,0],[0,0,0.75],0,10.5,7.9,0,[_radius/2,_radius/2+2,_radius/2-1], [[1,1,1,1],[1,1,1,1],[1,1,1,1]], [0.08], 1, 0, "", "", _obj];
_caldura setDropInterval 0.1;

[_fum] spawn { 
	_de_sters = _this select 0;
	sleep 80;
	deletevehicle _de_sters;
};

[_caldura] spawn { 
	_de_sters = _this select 0;
	sleep 70;
	deletevehicle _de_sters;
};