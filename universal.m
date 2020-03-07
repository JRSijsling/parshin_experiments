/***
 *  A universal family of examples for a single curve.
 *
 *  See LICENSE.txt for license details.
 */

/* Does not work on some versions beyond 2.21 */
F<a3,a2,a1,a0> := RationalFunctionField(Rationals(), 4);
R<x> := PolynomialRing(F);
f := x^8 + a3*x^6 + a2*x^4 + a1*x^2 + a0;

X := HyperellipticCurve(f);
J := Jacobian(X);

print "";
print "Curve:";
print X;

K<a,b> := FunctionField(X);
R<x> := PolynomialRing(K);
X := BaseExtend(X, K);
J := Jacobian(X);

E := J ! [ x^2 - a^2, b ];
D := 3*E;

print "";
print "Divisor:";
print E;
print "Threefold:";
print D;

/* The following does not run in later versions:
R<x> := PolynomialRing(K);
K<c> := FieldOfFractions(quo< R | D[1] >);
a := K ! a; b := K ! b;
R<x> := PolynomialRing(K);

X := BaseExtend(X, K);
J := Jacobian(X);

E := J ! [ x^2 - a^2, b ];
D := 3*E;
d := K ! D[2];
assert D eq J ! [ x^2 - c^2, d ];

Q := X ! [ a, b ]; iQ := X ! [ -a, -b ]; P := X ! [ c, -d ]; iP := X ! [ -c, d ];
Q := Divisor(Q); iQ := Divisor(iQ); P := Divisor(P); iP := Divisor(iP);
D := 3*iQ + iP - 3*Q - P;

K<x,y> := FunctionField(X);
L := FieldOfFractions(CoordinateRing(Ambient(AffinePatch(X, 1))));
h := hom< L -> K | [x,y] >;
hinv := hom< L -> K | [-x,-y] >;

test, f := IsPrincipal(D);
fL := L ! f;
f := h(fL); sf := hinv(fL);
la := f*sf;

g := la*f;
gL := L ! g;
g := h(gL); sg := hinv(gL);
la := F ! (g*sg);
test, c := IsPower(la, 3);
print "";
print "Is third power?";
print c;

h := g + sg;
print "";
print "Symmetrization:";
print h;
*/

