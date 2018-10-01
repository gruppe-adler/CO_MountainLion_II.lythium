params ["_pos", "_angle", "_vector"];

private _gasLeak = "#particlesource" createVehicleLocal _pos; 
_gasLeak setParticleParams [["\A3\data_f\ParticleEffects\Universal\Refract",1,0,1], "", "Billboard", 1, 2, [0, 0.2, 0.4],
 _vector, 0, 10, 7.9, 0.075, [0.01, 0.01, 0.1, 0.2], [[1, 1, 1, 0], [1, 1, 1, 0.1], [1, 1, 1, 1], [1, 1, 1, 0]], [0.08], 1, 0, "", "", "",_angle];
_gasLeak setParticleCircle [0, [0, 0, 0]];
_gasLeak setDropInterval 0.1;

_gasLeak