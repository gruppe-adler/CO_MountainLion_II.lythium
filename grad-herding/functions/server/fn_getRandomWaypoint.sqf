params ["_animal"];

// get new wp in 90° angle in front of lead animal
private _wp = _animal getRelPos [GRAD_HERDING_DISTANCE_TO_SHEPHERD, (random 45 - random 90)];

// diag_log format ["getting new wp randomly %1", _wp];

_wp