params ["_pos", "_offset"];

// get position even when input is object
if (typeName _pos = "OBJECT") then {
	_pos = position _pos;
};

_pos params ["_posX", "_posY", "_posZ"];
_offset params ["_offsX", "_offsY", "_offsZ"];

// add offsets
_pos set [0, _posX + _offsX];
_pos set [1, _posY + _offsY];
_pos set [2, _posZ + _offsZ];

// give back calculated result
_pos