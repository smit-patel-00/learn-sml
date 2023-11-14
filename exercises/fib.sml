fun fibHelp(0, a1, a2) = a1
| fibHelp(n, a1, a2) = fibHelp(n - 1, a2, a1 + a2);

fun fib n = fibHelp(n, 0, 1);

fib(10) = 55;
fib(8) = 21;
fib(2) = 1;