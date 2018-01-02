
int: budget;

var int: cost = 13 * F + 21 * L + 17 * Z + 100 * J;
constraint  cost <= budget;
var int: total = 6 * F + 10 * L + 8 * Z + 40 * J;

var 0..1000: F;
var 0..400: L;
var 0..500: Z;
var 0..150: J;

solve maximize total;

output["F = \(F), L = \(L), Z = \(Z), J = \(J), cost = \(cost), total = \(total)"];
