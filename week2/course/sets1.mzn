set of int: MOVES = 1..5;
int: timebound;

var set of MOVES: moves;

array[MOVES] of int: power;
array[MOVES] of int: duration;

timebound = 10;
power = [6, 8, 5, 3, 4];
duration = [4, 5, 3, 2, 3];

var int: total_power = sum(move in moves)(power[move]);
var int: total_duration = sum(move in moves)(duration[move]);

constraint total_duration <= timebound;

solve maximize total_power;

output["moves=",show(moves)," total_power=",show(total_power)];