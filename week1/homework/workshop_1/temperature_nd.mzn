enum CHOICE = {HEAT, STRONGLY_HEAT, COOL, STRONGLY_COOL, DO_NOTHING};

array[int] of int: readings;
int: start;

array[1..length(readings)+1] of var int: temp;

constraint temp[1] = start;

constraint forall(i in 2..length(readings)+1) (
temp[i] = (readings[i-1] + temp[i-1]) div 2
);

solve satisfy;
output["temp =", show(temp)];