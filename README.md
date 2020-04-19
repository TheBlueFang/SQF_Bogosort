# SQF_Bogosort
The highly inefficient [bogosort](https://en.wikipedia.org/wiki/Bogosort) algoritm created in SQF.

## Usage

###### Scheduled
Run bogosort.sqf with [execVM](https://community.bistudio.com/wiki/execVM).

For example in the [init.sqf](https://community.bistudio.com/wiki/Event_Scripts) file:
```
execVM "scheduled\bogosort.sqf";
```
###### Unscheduled
Run bogosort.sqs from a [scheduled](https://community.bistudio.com/wiki/Scheduler) or [unscheduled](https://community.bistudio.com/wiki/Scheduler) environment using the [exec](https://community.bistudio.com/wiki/exec) command.

For example in the [init.sqf](https://community.bistudio.com/wiki/Event_Scripts) file:
```
exec "scheduled\bogosort.sqf";
```