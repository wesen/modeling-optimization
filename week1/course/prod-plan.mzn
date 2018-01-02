enum PRODUCT;
array[PRODUCT] of float: profit;

enum RESOURCE;
array[RESOURCE] of float: capacity;

array[PRODUCT, RESOURCE] of float: consumption;

% how much we should make of each product
array[PRODUCT] of var int: produce;

% must produce a non-negative amount
constraint forall(p in PRODUCT) (produce[p] >= 0);

% production can only use the available resources:
constraint forall(r in RESOURCE) (
   sum (p in PRODUCT) (consumption[p, r] * produce[p]) <= capacity[r]
);

solve maximize sum(p in PRODUCT) (profit[p] * produce[p]);

output["\(p): \(produce[p])\n" | p in PRODUCT];
