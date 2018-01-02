int: n =  7;
array[1..n] of var 0..9: x;
constraint forall(i in 1..n)(x[i] > 0);
constraint forall(i in 1..(n-1))(x[i] <= x[i+1]);
constraint sum(x) = product(x);
solve satisfy;
output[show(x)];