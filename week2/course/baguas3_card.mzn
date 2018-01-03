int: nSpots;
enum SYMB;

set of int: SPOT = 1..nSpots;
array[SPOT] of int: damage;

array[SYMB] of set of SPOT: group;

var set of SPOT: attacks;

var int: total_damage = sum(spot in attacks)(damage[spot]);

constraint forall(s in SYMB)(card(attacks intersect group[s]) <= 1);

constraint card(attacks) <= 3;

solve maximize total_damage;

output["spots=",show(attacks)," total_damage=",show(total_damage)];
