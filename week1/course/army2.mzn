var 100..800: count;

var int: n5;
constraint n5 * 5 + 2 = count;

var int: n7;
constraint n7 * 7 + 2 = count;

var int: n12;
constraint n12 * 12 + 1 = count;

solve satisfy;

output["count: \(count)"];


