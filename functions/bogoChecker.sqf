_array = _this select 0;
_result = true;

for [{_i = 0}, {_i <= (count _array) - 1}, {_i = _i + 1}] do {
	
	if ((_array select _i) != (BOGO_ARRAY select _i)) then {
		_result = false;
	};
	
};

_result