// RUN CONFIG //
execVM "bogosort\bogoConfig.sqf";

// FUNCTIONS //
_path =  "bogosort\functions\";

bogo_checker = compile preprocessFile (_path + "bogoChecker" + ".sqf");
bogo_randomise = compile preprocessFile (_path + "bogoRandomise" + ".sqf");
//bogo_quicksort = compile preprocessFile (_path + "bogoQuicksort" + ".sqf");
bogo_main = compile preprocessFile (_path + "bogoMain" + ".sqf");

//// RUN BOGOSORT ////
if (BOGO_VM) then {
	[] call bogo_main;
} else {
	[] exec "scripts\bogosort.sqs";
};
