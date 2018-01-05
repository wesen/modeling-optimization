 enum HERO;
 enum SPOT;
 array[HERO, SPOT] of int: damage;
 
 array[HERO] of var SPOT: attacks;
 
 include "alldifferent.mzn";

constraint alldifferent(attacks);

%  constraint forall(i,j in HERO where i < j)(attacks[i] != attacks[j]);
 
 var int: total_damage = sum(i in HERO)(damage[i, attacks[i]]);
 
 solve maximize total_damage;