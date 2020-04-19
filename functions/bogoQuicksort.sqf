_input = _this select 0;

_pivotIndex = floor ((count _input - 1) / 2);
_pivotValue = _input select _pivotIndex;

{
	if (_x != _input select _pivot) then {
		if (_x < _pivotValue} then {

		};
} forEach _input;