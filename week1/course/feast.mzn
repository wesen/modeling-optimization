var int: S;
var int: F;
var int: M;

constraint S >= 0;
constraint F >= 0;
constraint M >= 0;

var int: satisfaction = 29 * S + 19 * F + 8 * M;
var int: size = 8 * S + 5 * F + 3 * M;

constraint size <= 18;

solve maximize satisfaction;
