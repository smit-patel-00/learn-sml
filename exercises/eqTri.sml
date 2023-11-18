datatype shape = Point of real * real
| Line of (real * real) * (real * real)
| Triangle of (real * real) * (real * real) * (real * real)


fun showTriCood [] = []
| showTriCood(Triangle(a,b,c)::ps) = (a,b,c)::showTriCood(ps)
| showTriCood(p::ps) = showTriCood(ps)

fun filterTri [] = []
| filterTri(Triangle(a,b,c)::ps) = Triangle(a,b,c)::filterTri(ps)
| filterTri(p::ps) = filterTri(ps)

fun sqr x :real = x * x;
fun len ((x1 :real,y1 :real), (x2 :real, y2 :real)) = Math.sqrt(sqr(x2-x1) + sqr(y2-y1));
fun nearlyEqual(x1, x2) = Real.abs(x1-x2) < 0.001;

nearlyEqual(1.0, 1.0000001);

fun isEqTri (Triangle(a,b,c)) = nearlyEqual(len(a,b), len(b, c)) andalso nearlyEqual(len(a, b), len(a, c))
| isEqTri other = false;

fun trisHasEqTri [] = false
| trisHasEqTri([tri]) = isEqTri(tri)
| trisHasEqTri(tri::rest) = isEqTri(tri) orelse trisHasEqTri(rest);

fun shapesHasEqTri lst = trisHasEqTri(filterTri(lst));

val irrat = 0.8660254037844386467637231707529361834714026269051903140279034897;

val shapes = [Line((2.2,3.5),(4.1,5.0)), Point(4.5,2.0), Triangle((21.0, 4.5),(15.5, 21.1),(10.5, 10.2))];
showTriCood(shapes);

Real.compare(irrat, Math.sin(Math.pi/3.0));
Real.compare(len((0.0, irrat), (irrat, 0.0)), Math.sqrt(sqr(irrat) * 2.0));
len((0.5, irrat), (0.0, 0.0));
Real.compare(len((0.5, irrat), (0.0, 0.0)), 1.0);
val ex1 = [Triangle((0.0, 0.0), (1.0, 0.0), (0.5, irrat))];
val ex2 = [Triangle((0.0, 0.0), (1.0, 0.0), (0.0, 1.0))];

shapesHasEqTri(ex1);
shapesHasEqTri(ex2);
shapesHasEqTri([]);
shapesHasEqTri([Line((0.0,0.0),(1.0,1.0))]);