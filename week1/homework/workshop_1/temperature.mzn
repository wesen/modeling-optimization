enum CHOICE = {HEAT, STRONGLY_HEAT, COOL, STRONGLY_COOL, DO_NOTHING};
array[CHOICE] of int: price = [1, 5, 3, 9, 0];
array[CHOICE] of int: effect = [1, 4, -2, -5, 0];

array[int] of int: readings;
int: start;

array[1..length(readings)+1] of var int: temp;
array[1..length(readings)] of var int: read_temps;
array[1..length(readings)] of var CHOICE: choice;
array[1..length(readings)] of var int: costs;

constraint temp[1] = start;

constraint forall(i in 1..length(readings)) (
let { 
   var int: read_temp =(readings[i] + temp[i]) div 2;
   var CHOICE: cur_choice;
   } in 
   if read_temp > 32 then
      cur_choice = STRONGLY_COOL
    else 
       if read_temp > 30 then
        cur_choice = COOL
       else 
          if read_temp <= 23 then
            cur_choice = STRONGLY_HEAT
          else 
             if read_temp <= 24 then
              cur_choice = HEAT
            else
              cur_choice = DO_NOTHING            
           endif
         endif
       endif
     endif
     /\
   read_temps[i] = read_temp
   /\
  temp[i+1] = read_temp + effect[cur_choice] 
    /\ 
    costs[i] = price[cur_choice]
    /\
    choice[i] = cur_choice
);

solve satisfy;
output["temp =", show(temp),"\n"
   ++ "read_temps = ",show(read_temps),"\n" 
   ++ "choice = ",show(choice),"\n" 
   ++ "price =",show(sum(costs))
   ];