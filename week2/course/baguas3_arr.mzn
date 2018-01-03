int: nSpots;
enum SYMB;

set of int: SPOT = 1..nSpots;
array[SPOT] of int: damage;

array[SYMB] of set of SPOT: group;

set of int: SPOTx = {0} union SPOT;

int: size = 3;
array[1..size] of var SPOTx: attacks;

constraint forall(i in 1..size-1)(attacks[i] >= (attacks[i] != 0) + attacks[i+1]);

var int: total_damage = sum(spot in attacks where spot > 0)(damage[spot]);

constraint forall(s in SYMB)(sum(i in 1..size)(attacks[i] in group[s]) <= 1);

solve maximize total_damage;

output["spots=",show(attacks)," total_damage=",show(total_damage)];
