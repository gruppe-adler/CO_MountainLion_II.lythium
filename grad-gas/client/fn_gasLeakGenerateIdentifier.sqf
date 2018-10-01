private _index = missionNamespace getVariable ["grad_gas_sourceIndex", 0];
_index = _index + 1;

private _leakIdentifier = format ["grad_gas_leakClosed_%1", _index];
_leakIdentifier