params ["_pos", "_radius", "_angle"];

private _gasClouds = "#particlesource" createVehicleLocal _pos; 
_gasClouds setParticleParams [["\A3\data_f\ParticleEffects\Universal\Refract",1,0,1], "", "Billboard", 1, 10, [0, 0, -6], 
[0, 0.2, -0.03], 1, 1.275, 1, 0, [0, 10], [[1, 1, 1, 0], [1, 1, 1, 0.2], [1, 1, 1, 0]], [1000], 1, 0, "", "", "",_angle];
_gasClouds setParticleRandom [5, [_radius, _radius, 0], [0, 0, 0], 2, 0.5, [0, 0, 0, 0.1], 0, 0];
_gasClouds setParticleCircle [1, [0, 0, 0]];
_gasClouds setDropInterval 0.1;

_gasClouds