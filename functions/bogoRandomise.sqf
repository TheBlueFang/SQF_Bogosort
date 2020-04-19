_array = _this select 0;

for [{_i = 0}, {_i < (count _array + 1)}, {_i = _i + 1}] do {
	_random1 = round (random (count _array - 1));
	_item1 = _array select _random1;

	_random2 = round (random (count _array - 1));
	_item2 = _array select _random2;

	_array set [_random1, _item2];
	_array set [_random2, _item1];
};

_array