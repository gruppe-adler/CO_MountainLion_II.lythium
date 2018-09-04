params ["_box"];

if (!isServer) exitWith {};

// default mags
_box addMagazineCargoGlobal ["30Rnd_556x45_Stanag", 100];

// AT
_box addMagazineCargoGlobal ["rhs_mag_maaws_HEDP", 5];
_box addMagazineCargoGlobal ["rhs_mag_maaws_HE", 5];
_box addMagazineCargoGlobal ["rhs_mag_maaws_HEAT", 5];

// MG
_box addMagazineCargoGlobal ["rhs_200rnd_556x45_M_SAW", 20];


// pilot MP
_box addMagazineCargoGlobal ["rhsusf_mag_40Rnd_46x30_AP", 20];


// smokes
_box addMagazineCargoGlobal ["SmokeShell", 20];
_box addMagazineCargoGlobal ["SmokeShellPurple", 20];
_box addMagazineCargoGlobal ["SmokeShellRed", 20];
_box addMagazineCargoGlobal ["SmokeShellYellow", 20];
_box addMagazineCargoGlobal ["SmokeShellGreen", 20];
_box addMagazineCargoGlobal ["SmokeShellBlue", 20];
_box addMagazineCargoGlobal ["SmokeShellOrange", 20];
_box addMagazineCargoGlobal ["HandGrenade", 20];


// sniper
_box addMagazineCargoGlobal ["rhsusf_5Rnd_300winmag_xm2010", 30];

// additional AT
_box addWeaponCargoGlobal ["rhs_weap_M136", 5];

// entrenching
_box addItemCargoGlobal ["ACE_entrenchingTool", 10];
_box addItemCargoGlobal ["ACE_TacticalLadder_Pack", 3];
