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

avgFrames = 0;
frameCounter = 0;
elapsedTime = 0;
totalFrames = 0;

onEachFrame {
	frameCounter = frameCounter + 1;
	totalFrames = totalFrames + 1;
	avgFrames = round (getFPS select 1);

	if (frameCounter == avgFrames) then {
		frameCounter = 0;
		avgFrames = 0;

		elapsedTime = elapsedTime + 1;
	};
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

	if (_iterations % 1000 == 0) then {
		systemChat format ["Iterations done: %1", _iterations];
	};

	if (_iterations % 10000 == 0) then {
		systemChat "Still haven't found it...";
	};

};

onEachFrame {};

if (avgFrames != 0) then {
	_remainder = round(frameCounter / avgFrames * 100);
};

if ([_array] call bogo_checker) then {_return = true} else {_return = false};

if (_return) then {
systemChat format ["Result: %1", _array];
systemChat format ["Elapsed time: %1.%2 seconds with %3 iterations.", elapsedTime, _remainder, _iterations];
systemChat format ["Frames wasted: %1", totalFrames];
} else {
	systemChat "BOGOSORT HAS FAILED";
};

unprotect "arraySorted";
elapsedTime = nil;
avgFrames = nil;
frameCounter = nil;
totalFrames = nil;
arraySorted = nil;

_return