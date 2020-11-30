param n;
param m;

set I := {1..n};
set J := {1..m};

param A {I,J};
param y {I};

var b{J};
var t{I};

minimize sum_dev:
	sum {i in I} t[i];
	
subject to lowerbound {i in I}:
	-t[i] <= y[i] - sum {j in J} (A[i,j]*b[j]);
	
subject to upperbound {i in I}:
	y[i] - sum {j in J} (A[i,j]*b[j]) <= t[i];