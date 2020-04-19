protect "BOGO_ARRAY";

// Check input type
switch (typeName _this) do {
	case "ARRAY": {_veh = _this select 0;};
	default { if (true) exitWith {[-1, 20] diagMessage format ["bogoMain.sqf error: Parameter Type %1, expected Array", typeName _input]} };
};

{
	if (typeNamef _x != "SCALAR") exitWith {[-1, 20] diagMessage format ["bogoMain.sqf: Array must contain numbers only", typeName _input]}
} forEach _input;

// Start timer
if (BOGO_VM) then {

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

};

//// START SORTING ////
_array = [BOGO_ARRAY] call bogo_randomise;

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

	if (_iterations / 50000 == 0) then {
		systemChat "Still haven't found it...";
	};

	if (_iterations / 100000 == 0) then {
		systemChat "This may take a while...";
	};

	if (_iterations / 250000 == 0) then {
		systemChat "Patience...";
	};

};


//// RETURN RESULTS ////
onEachFrame {};

if (avgFrames != 0) then {
	_remainder = round(frameCounter / avgFrames * 100);
} else {
	_remainder = 0;
};

_return = [_array] call bogo_checker; //Check that the final array truly is sorted (Unscheduled environment)

if (_return) then {
	
	systemChat format ["Result: %1", _array];

	if (BOGO_VM) then {
		systemChat format ["Elapsed time: %1.%2 seconds with %3 iterations.", elapsedTime, _remainder, _iterations];
		systemChat format ["Frames wasted: %1", totalFrames];
	};
} else {
	systemChat "BOGOSORT HAS FAILED";
};

unprotect "BOGO_ARRAY";

// Delete variables to save memory
if (BOGO_VM) then {
	elapsedTime = nil;
	avgFrames = nil;
	frameCounter = nil;
	totalFrames = nil;
};

_return