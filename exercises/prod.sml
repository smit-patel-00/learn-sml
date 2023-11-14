(* Make tail recursive *)

fun prodHelp([], acc) = acc
| prodHelp(n::ns, acc) = prodHelp(ns, acc * n);

fun prod lst = prodHelp(lst, 1);

prod([2,3,4,5]) = 120;
prod([]) = 1;