array[int] of int: readings = [35,35,20,20,20];
int: start = 25;

array[1..length(readings)+1] of var int: temp;

constraint temp[1] = start;

constraint forall(i in 2..length(readings)+1) (
%    temp[i] = (temp[i-1] + readings[i-1]) / 2
temp[i] = (readings[i-1] + temp[i-1]) div 2
% temp[i] = temp[i]
   );

solve satisfy;
output["temp =", show(temp)];