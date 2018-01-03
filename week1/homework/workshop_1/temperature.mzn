enum CHOICE = {HEAT, STRONGLY_HEAT, COOL, STRONGLY_COOL, DO_NOTHING};
array[CHOICE] of int: price = [1, 5, 3, 9, 0];
array[CHOICE] of int: effect = [1, 4, -2, -5, 0];

array[int] of int: readings;
int: start;

int: l = length(readings);
set of int: TIME0 = 0..l;
set of int: TIME = 1..l;

array[TIME0] of var 25..30: temp;
array[TIME] of var CHOICE: choice;

constraint temp[0] = start;

var int: cost = sum([price[choice[t]] | t in TIME]);

constraint forall(t in TIME) (
  temp[t] = (readings[t] + temp[t-1]) div 2 + effect[choice[t]] 
);

solve minimize cost;

output["temp =", show(temp),"\n"
   ++ "choice = ",show(choice),"\n" 
   ++ "price =",show(cost),"\n"
   ];