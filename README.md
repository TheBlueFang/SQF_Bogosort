# SQF_Bogosort
The highly inefficient [bogosort](https://en.wikipedia.org/wiki/Bogosort) algorithm created in SQF.

## Usage

**Config**

You can change bogosort settings from the bogosortConfig.sqf file.

**Running**

Run bogosort.sqf with [execVM](https://community.bistudio.com/wiki/execVM).

For example in the [init.sqf](https://community.bistudio.com/wiki/Event_Scripts) file:
```
execVM "scheduled\bogosort.sqf";
```