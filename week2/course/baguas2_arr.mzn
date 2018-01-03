int: nSpots;
enum SYMB;

set of int: SPOT = 1..nSpots;
array[SPOT] of int: damage;

array[SYMB] of set of SPOT: group;

int: size = 3;
array[1..size] of var SPOT: attacks;

constraint forall(i in 1..size-1)(attacks[i] < attacks[i+1]);

var int: total_damage = sum(spot in attacks)(damage[spot]);

constraint forall(s in SYMB)(sum(i in 1..size)(attacks[i] in group[s]) <= 1);

solve maximize total_damage;

output["spots=",show(attacks)," total_damage=",show(total_damage)];
