arraySorted = [1,2,3,4,5,6,7,8,9,10];

protect "arraySorted";

private ["_array"];


bogo_randomise = {
	_array = _this select 0;

	for [{_i = 0}, {_i < 10}, {_i = _i + 1}] do {
		_random1 = round (random (count _array - 1));
		_item1 = _array select _random1;

		_random2 = round (random (count _array - 1));
		_item2 = _array select _random2;

		_array set [_random1, _item2];
		_array set [_random2, _item1];
	};

	//systemChat format ["%1", _array];
	_array
};

bogo_checker = {
	_array = _this select 0;
	_result = true;

	for [{_i = 0}, {_i <= (count _array) - 1}, {_i = _i + 1}] do {
		
		if ((_array select _i) != (arraySorted select _i)) then {
			_result = false;
		};
		
	};
	
	_result
};

_array = [arraySorted] call bogo_randomise;

systemChat "Sorting array...";

_iterations = 1;
_isSorted = false;
while {!_isSorted} do {

	if ([_array] call bogo_checker) then {
		_isSorted = true;
	} else {
		[_array] call bogo_randomise;
		_iterations = _iterations + 1
	};

};
if (avgFrames != 0) then {
	_remainder = round(frameCounter / avgFrames * 100);
};

if ([_array] call bogo_checker) then {_return = true} else {_return = false};

systemChat format ["Result: %1", _array];

unprotect "arraySorted";
arraySorted = nil;

_return