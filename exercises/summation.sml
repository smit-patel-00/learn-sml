fun summation f m =
    let fun sum (i,z) : real =
        if i=m then z else sum (i+1, z+(f i))
    in sum (0, 0.0) end;

fun g(i,j) = real ((i - j) * (i - j));

fun h(x, y) = summation (fn i => summation (fn j => g(i, j)) x) y; 

summation (fn i => summation (fn j => g(i, j)) 10) 10;
h(10, 10);