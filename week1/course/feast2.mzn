enum DISH;
int: capacity;
array[DISH] of int: satisf;
array[DISH] of int: size;

array[DISH] of var int: amt;

constraint forall(i in DISH)(amt[i] >= 0);
constraint sum(i in DISH)(size[i] * amt[i]) <= capacity;
var int: total_satisf = sum(i in DISH)(satisf[i] * amt[i]);
solve maximize total_satisf;
output ["Amount = ", show(amt), "satisf = ", show(total_satisf), "\n"];  