datatype 'a tree = Lf | Br of 'a * 'a tree * 'a tree;

val birnam = Br(1, Br(2, Lf, Br(3,Br(4,Lf,Lf), Lf)), Lf);

fun preorderHelp (Lf, acc) = acc
| preorderHelp (Br(v, t1, t2), acc) = v::preorderHelp(t1, preorderHelp(t2, acc));

fun inorderHelp (Lf, acc) = acc
| inorderHelp (Br(v, t1, t2), acc) = preorderHelp(t1, v::preorderHelp(t2, acc));

fun postorderHelp (Lf, acc) = acc
| postorderHelp (Br(v, t1, t2), acc) = postorderHelp(t1, postorderHelp(t2, v::acc));

fun preorder x = preorderHelp(x, []);
fun inorder x = inorderHelp(x, []);
fun postorder x = postorderHelp(x, []);

preorder(birnam);
inorder(birnam);
postorder(birnam);