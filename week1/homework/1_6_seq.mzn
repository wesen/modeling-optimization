int: n;
array[1..n] of var 0..3: x;
constraint x[1] == 0;
constraint x[n] == 3;
constraint forall (i in 1..n-1)((x[i] + x[i+1]) <= 3);
constraint forall (i in 1..n where (i mod 3) == 0)(x[i] >= 2);
% int: foo = min (i in 1..4 where i > 3)(i);

% forall([x[i] >= 2 | i in 1..n where i < 4]);
var int: total = sum(x);
solve maximize total;

output[show(total), "=", show(x)];