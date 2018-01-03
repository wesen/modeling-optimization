set of int: MOVES = 1..5;
int: timebound;

set of MOVES: moves;

array[MOVES] of int: power;
array[MOVES] of int: duration;

var int: total_power = sum(move in moves)(power[move]);
var int: total_duration = sum(move in moves)(duration[move]);

constraint total_duration <= timebound;

solve maximize total_power;