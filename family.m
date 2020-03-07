/***
 *  An family of examples for a single curve.
 *
 *  See LICENSE.txt for license details.
 */

/* Does not work on some versions beyond 2.21 */
F := Rationals();
R<x> := PolynomialRing(F);
f := x^8 + 2*x^2 + 1;

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

/* Does not work
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

K<x,y> := FunctionField(X);
test, f := IsPrincipal(D);

print "";
print "Generator of divisor:";
print f;

f := (-4*a^24 - 24*a^18 - 12*a^16 - 48*a^12 - 48*a^10 - 12*a^8 - 32*a^6 - 48*a^4 -
    24*a^2 - 4)/(8*a^18 + 12*a^16 + 12*a^12 + 48*a^10 + 24*a^8 - 48*a^6 - 60*a^4 -
    24*a^2 - 3)/(x^4 + (-c - 3*a)*x^3 + (3*a*c + 3*a^2)*x^2 + (-3*a^2*c - a^3)*x +
    a^3*c)*y + ((-4*a^20 - 24*a^14 - 16*a^12 - 30*a^8 - 40*a^6 - 12*a^4 + 4*a^2 +
    2)/(8*a^18 + 12*a^16 + 12*a^12 + 48*a^10 + 24*a^8 - 48*a^6 - 60*a^4 - 24*a^2 -
    3)*b*x^4 + (12*a^16 + 16*a^14 + 12*a^10 + 40*a^8 + 16*a^6 - 24*a^4 - 20*a^2 -
    4)/(8*a^18 + 12*a^16 + 12*a^12 + 48*a^10 + 24*a^8 - 48*a^6 - 60*a^4 - 24*a^2 -
    3)*b*x^2 + (-12*a^18 - 12*a^16 - 30*a^12 - 48*a^10 - 16*a^8 - 12*a^6 - 30*a^4
    - 20*a^2 - 4)/(8*a^18 + 12*a^16 + 12*a^12 + 48*a^10 + 24*a^8 - 48*a^6 - 60*a^4
    - 24*a^2 - 3)*b)/(x^4 + (-c - 3*a)*x^3 + (3*a*c + 3*a^2)*x^2 + (-3*a^2*c -
    a^3)*x + a^3*c);
sx := -x; sy := -y;
sf := (-4*a^24 - 24*a^18 - 12*a^16 - 48*a^12 - 48*a^10 - 12*a^8 - 32*a^6 - 48*a^4 -
    24*a^2 - 4)/(8*a^18 + 12*a^16 + 12*a^12 + 48*a^10 + 24*a^8 - 48*a^6 - 60*a^4 -
    24*a^2 - 3)/(sx^4 + (-c - 3*a)*sx^3 + (3*a*c + 3*a^2)*sx^2 + (-3*a^2*c - a^3)*sx +
    a^3*c)*sy + ((-4*a^20 - 24*a^14 - 16*a^12 - 30*a^8 - 40*a^6 - 12*a^4 + 4*a^2 +
    2)/(8*a^18 + 12*a^16 + 12*a^12 + 48*a^10 + 24*a^8 - 48*a^6 - 60*a^4 - 24*a^2 -
    3)*b*sx^4 + (12*a^16 + 16*a^14 + 12*a^10 + 40*a^8 + 16*a^6 - 24*a^4 - 20*a^2 -
    4)/(8*a^18 + 12*a^16 + 12*a^12 + 48*a^10 + 24*a^8 - 48*a^6 - 60*a^4 - 24*a^2 -
    3)*b*sx^2 + (-12*a^18 - 12*a^16 - 30*a^12 - 48*a^10 - 16*a^8 - 12*a^6 - 30*a^4
    - 20*a^2 - 4)/(8*a^18 + 12*a^16 + 12*a^12 + 48*a^10 + 24*a^8 - 48*a^6 - 60*a^4
    - 24*a^2 - 3)*b)/(sx^4 + (-c - 3*a)*sx^3 + (3*a*c + 3*a^2)*sx^2 + (-3*a^2*c -
    a^3)*sx + a^3*c);
la := f*sf;

h := f + sf;
print "";
print "Symmetrization:";
print h;

