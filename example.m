/***
 *  An example for a single curve.
 *
 *  See LICENSE.txt for license details.
 */

F := Rationals();
R<x> := PolynomialRing(F);

a := 1;
S := [-5..5];
repeat
    repeat
        a3 := Random(S); a2 := Random(S); a1 := Random(S); a0 := Random(S);
        // Manual selection
        a3 := 4; a2 := 4; a1 := 0; a0 := -5;
        f := x^8 + a3*x^6 + a2*x^4 + a1*x^2 + a0;
        test, b := IsSquare(Evaluate(f, a));
    until test and Discriminant(f) ne 0;
    X := HyperellipticCurve(f);
    J := Jacobian(X);

    // Q - i (Q) = Q + j (Q) - 2 inf
    E := J ! [ x^2 - a, b ];
    D := 3*E;
until D[1] ne x^2 - a and #Factorization(D[1]) eq 2 and not D[1]*D[2] in F;

print "";
print "Curve:";
print X;

print "";
print "Divisor:";
print E;
print "Threefold:";
print D;

c := Roots(D[1], F)[2][1];
d := (F ! D[2]);

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
la := F ! (f*sf);

// Manual optimization
la := 3*5^2/2;
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

print "";
print Support(Divisor(h));

// Manual transfer to quotient
R<x> := PolynomialRing(F);
f := x*(x^4 + 4*x^3 + 4*x^2 - 5);
X := HyperellipticCurve(f);
K<u,v> := FunctionField(X);
h := (-320*u - 480)/(9*u^4 - 76*u^3 + 174*u^2 - 156*u + 49)*v + (210*u^4 + 1320*u^3 - 6860*u^2 + 2680*u + 1050)/(9*u^4 - 76*u^3 + 174*u^2 - 156*u + 49);

print "";
print "Check factorization of a:";
print Support(Divisor(h));

print "";
print "Check factorization of a^2 - 4*c^3:";
print Support(Divisor(h^2 - 4*c^3));

